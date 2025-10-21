//
//  Network.swift
//  Mahjong
//
//  Created by zsq on 2025/10/14.
//

import Foundation
import Moya
import HandyJSON

//// 业务错误枚举（与后端约定）
//enum BusinessError: Error {
//    case tokenExpired // Token 过期
//    case serverError(code: Int, message: String) // 服务器返回的错误码
//    case dataEmpty // 数据为空
//    // 其他自定义业务错误...
//}

// 统一错误类型：涵盖业务错误和 Moya 原生错误
public enum BusinessError: Error {
    // 业务相关错误
    case tokenExpired // Token 过期
    case serverError(code: Int, message: String) // 服务器返回的错误码
    case dataEmpty // 数据为空
    
    // Moya 原生错误（将 MoyaError 作为关联值）
    case moyaError(MoyaError)
    
//    // 其他自定义错误
    case unknownError // 未知错误
}

public extension MoyaError {
    // 将 MoyaError 转换为 BusinessError
    public var  toBusinessError: BusinessError {
        return .moyaError(self)
    }
}

// 扩展以获取错误信息
extension BusinessError: LocalizedError {
    public var  errorDescription: String? {
        switch self {
        case .tokenExpired:
            return "登录已过期，请重新登录"
        case .serverError(_, let message):
            return message
        case .dataEmpty:
            return "暂无数据"
        case .moyaError(let moyaError):
            return moyaError.localizedDescription
        case .unknownError:
            return "发生未知错误"
        }
    }
}

public struct BaseResponse<T: HandyJSON>: HandyJSON {
    public var  msg:String?
    public var  data: T?
    public var  code: Int = 0
    
    public init() {
        
    }
}

public struct StringResponse: HandyJSON {
    public var  msg:String?
    public var  data: String?
    public var  code: Int = 0
    
    public init() {
        
    }
}

public struct Network {
    //    static let provider = MoyaProvider<YueYuService>(endpointClosure: endpointClosure)
    static let provider = MoyaProvider<YueYuService>(plugins:  [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
    
   public static func request<T: HandyJSON>(
        target: YueYuService,
        model: T.Type,
        success successCallback:@escaping (T?) -> Void,
        failure failureCallback: @escaping ((BusinessError) -> Void)) {
            provider.request(target) { result in
                switch result {
                case let .success(response):
                    
                    self.handleSuccessResponse(response, model: model, success: successCallback, failure: failureCallback)
                    //                if let returnData =  try? response.mapModel(BaseResponse<T>.self){
                    //                    if returnData.code == 200  {
                    //                        successCallback(returnData.data)
                    //                    } else {
                    //                        failureCallback(returnData.code, returnData.msg ?? "未知错误")
                    //                    }
                    //                } else {
                    //                    failureCallback(response.statusCode, "未知错误")
                    //                }
                    
                case let .failure(error):
                    //                if target.shouldRetry {
                    //                    retryWhenReachable(target, successCallback, errorCallback, failureCallback)
                    //                }
                    //                else {
                    failureCallback(error.toBusinessError)
                    //                    failureCallback(error)
                    //                }
                }
            }
        }
    
    public static func requestString(
        target: YueYuService,
        //        model: T.Type,
        success successCallback:@escaping (StringResponse?) -> Void,
        failure failureCallback:@escaping (BusinessError) -> Void) {
            provider.request(target) { result in
                switch result {
                case let .success(response):
                    
                    if let returnData =  try? response.mapStringModel(StringResponse.self) {
                        successCallback(returnData)
                    } else {
                        //                    errorCallback?(response.statusCode)
                    }
                    
                case let .failure(error):
                    //                if target.shouldRetry {
                    //                    retryWhenReachable(target, successCallback, errorCallback, failureCallback)
                    //                }
                    //                else {
                    failureCallback(error.toBusinessError)
                   
                    //                }
                }
            }
        }
    
    
    /// 处理请求成功的响应
    static func handleSuccessResponse<T: HandyJSON>(
        _ response: Response,
        model: T.Type,
        success successCallback:@escaping (T?) -> Void,
        failure failureCallback:@escaping (BusinessError) -> Void) {
            
            do {
                // 解析基础响应模型
                let baseResponse = try response.mapModel(BaseResponse<T>.self)
                if baseResponse.code == 200 {
                        // 业务成功：检查 data 是否为空
                    guard let data = baseResponse.data else {
                            failureCallback(.dataEmpty)
                            return
                        }
                        successCallback(data)
                    } else {
                        // 业务错误：根据 code 处理（如 Token 过期）
                        if baseResponse.code == 401 {
                            failureCallback(.tokenExpired)
                        } else {
                            failureCallback(.serverError(code: baseResponse.code, message: baseResponse.msg ?? ""))
                        }
                    }
                
            } catch let error {
                // JSON 解析失败（如数据格式不符）
                if let error = error as? MoyaError {
                    failureCallback(BusinessError.moyaError(error))
                } else {
                    failureCallback(BusinessError.unknownError)
                }
            }
        }
}
    
//    /// 处理 Moya 原生错误
//    private func handleMoyaError<T>(_ error: MoyaError, completion: @escaping (Result<T, Error>) -> Void) {
//        switch error {
//        case .networkError(let urlError):
//            // 网络错误（无网络、超时等）
//            completion(.failure(urlError))
//        case .statusCode(let response):
//            // HTTP 状态码错误（4xx、5xx 等）
//            let statusCode = response.statusCode
//            completion(.failure(NSError(domain: "HTTPError", code: statusCode, userInfo: [NSLocalizedDescriptionKey: "服务器错误，状态码：\(statusCode)"])))
//        case .jsonMapping, .objectMapping, .stringMapping:
//            // 数据解析错误
//            completion(.failure(NSError(domain: "ParseError", code: -1, userInfo: [NSLocalizedDescriptionKey: "数据解析失败"])))
//        default:
//            // 其他错误（URL 无效、参数编码失败等）
//            completion(.failure(NSError(domain: "MoyaError", code: -2, userInfo: [NSLocalizedDescriptionKey: error.localizedDescription])))
//        }
//    }
//}


extension Response {
    func mapModel<T: HandyJSON>(_ type: T.Type) throws -> T {
        let jsonString = String(data: data, encoding: .utf8)
        guard let model = JSONDeserializer<T>.deserializeFrom(json: jsonString) else {
            throw MoyaError.jsonMapping(self)
        }
        return model
    }
    
    func mapStringModel<T: HandyJSON>(_ type: T.Type) throws -> T {
        let jsonString = String(data: data, encoding: .utf8)
        guard let model = JSONDeserializer<T>.deserializeFrom(json: jsonString) else {
            throw MoyaError.jsonMapping(self)
        }
        return model
    }
}

//extension MoyaProvider {
//    @discardableResult
//    public func request<T: HandyJSON>(_ target: Target,
//                                    model: T.Type,
//                                    completion: ((_ returnData: T?) -> Void)?) -> Cancellable? {
//
//        return request(target, completion: { (result) in
//            guard let completion = completion else { return }
//            guard let returnData = try? result.value?.mapModel(LBUResponseData<T>.self) else {
//                completion(nil)
//                return
//            }
//            completion(returnData.data?.returnData)
//        })
//    }
//}
