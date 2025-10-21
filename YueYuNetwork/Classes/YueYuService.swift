//
//  YueYuService.swift
//  Mahjong
//
//  Created by zsq on 2025/10/14.
//

import Foundation
import Moya

var headerToken: String = ""
public enum YueYuService {
    case zen
    case showUser(id: Int)
    case createUser(firstName: String, lastName: String)
    case updateUser(id: Int, firstName: String, lastName: String)
    case showAccounts
    
    
    // 登录相关
    case loginPhoneMsgCode(phonenumber: String, msgtype: String)
    case loginRegisterUser(phonenumber: String, password: String, msgcode: String)
    case loginByPhone(phonenumber: String, password: String?, msgcode: String?)
//    case loginByWX
//    case loginUnbindWX
//    case loginBindWXOpenID
//    case loginGetUserInfo
//    case searchUserInfoByPhoneName
//    case userInfoUpdateByTXIMId
//    case userInfoHandleTXIMUserSignTxt
//    case loginRefresh
//    case apkDownUrl
//    case loginLogout
//    
//    // 商户相关
//    case merchantListMerchantInfo
//    case merchantQueryMerchants
//    case merchantProductsByMerchantId
//    case merchantCollectsAdd
//    case merchantCollectsCancel
//    case merchantCollectsList
//    case merchantGetByCouponCode
//    case merchantProductsListOrderGamePlayRoom
//    case merchantProductRoomByProductId
//    case merchantQueryComments
//    case merchantListGamePlayType
//    case merchantAreaRelease
//    case merchantGetListGamePlayType
//    case merchantProductTypeListAll
//    case merchantListProductsByMerchantId
//    
//    // 订单相关
//    case orderCreateOrder
//    case orderUpdateOrderGamePlayTypeById
//    case orderJoinOrderGamePlay
//    case orderExitOrderGamePlay
//    case orderHandleOrderStatus4Over
//    case orderKickingJoinOrderGamePlayUser
//    case orderSignOrderGamePlay
//    case orderSetOrderStart
//    case orderGetUserShopCartNumber
//    case orderListShopCart
//    case orderAddShopCart
//    case orderUpdateBuyAllJoinShopCart
//    case orderListOrderByUserId
//    case orderDelOrderInfo
//    case orderComments
//    case orderGetProductRoomInfoByOrderGamePlay
//    case orderGetUserOrderInfoByOrderId
//    case orderUserAlreadyGotCoupon
//    case orderListWaitReceiveCoupon
//    case orderUserReceiveCoupon
//    case orderOrderPayMoney
//    case orderMakePayInfo
//    case orderGetPayMoneyOrderUser
//    case orderMakeAliPayInfo
    
    // 视频相关
    case videoSelectVideosByPage(pageNum: Int, pageSize: Int)
//    case videoSelectVideosByUserInfo
//    case videoIncrementPlayCount
//    case videoBatchAdd
//    case videoOSSTemporarySignature
//    case videoGenerateStsSecurityToken
//    case videoApp2OssStsSecurityToken
//    case videoOSSDownloadYearSig
}


// MARK: - TargetType Protocol Implementation
extension YueYuService: TargetType {
    
//    var baseURL: URL { URL(string: "https://www.yueyu.com/yyserver")! }
    public var baseURL: URL { URL(string: "https://www.vminfor.com/yyserver")! }

    public var path: String {
        switch self {
        case .zen:
            return "/zen"
        case .showUser(let id), .updateUser(let id, _, _):
            return "/users/\(id)"
        case .createUser(_, _):
            return "/users"
        case .showAccounts:
            return "/accounts"
            
//MARK:  YueYu
        case .loginPhoneMsgCode(_,_):
            return "/auth/yyphonemsgcode"
        case .loginRegisterUser(_, _, _):
            return "/auth/yyregisteruser"
        case .loginByPhone(_, _, _):
            return "/auth/yyloginbyphone"
//        case .loginByWX:
//            return "/auth/yywechatcallback"
//        case .loginUnbindWX:
//            return "/auth/yyUnbindWxopenid"
//        case .loginBindWXOpenID:
//            return "/auth/yyloginbindwxopenid"
//        case .loginGetUserInfo:
//            return "/yy-user/userinfo/userinfobyphonenumber"
//        case .searchUserInfoByPhoneName:
//            return "/user/userinfo/searchUserInfoByPhoneName"
//        case .userInfoUpdateByTXIMId:
//            return "/yy-user/userinfo/updateUserInfoByTximId"
//        case .userInfoHandleTXIMUserSignTxt:
//            return "/user/userinfo/handleTXIMUserSignTxt"
//        case .loginRefresh:
//            return "/auth/yyrefresh"
//        case .apkDownUrl:
//            return "/platform/platform/apkDownUrl"
//        case .loginLogout:
//            return "/auth/yylogout"
//        case .merchantListMerchantInfo:
//            return "/merchant/merchant/listmerchantinfo"
//        case .merchantQueryMerchants:
//            return "//merchant/merchant/queryMerchants"
//        case .merchantProductsByMerchantId:
//            return "/merchant/merchant/getMerchantProductsByMerchantId"
//        case .merchantCollectsAdd:
//            return "/interact/collects/add"
//        case .merchantCollectsCancel:
//            return "/interact/collects/cancel"
//        case .merchantCollectsList:
//            return "/interact/collects/myCollects"
//        case .merchantGetByCouponCode:
//            return "/merchant/merchant/getMerchantByCouponCode"
//        case .merchantProductsListOrderGamePlayRoom:
//            return "/merchant/products/listOrderGamePlayRoom"
//        case .merchantProductRoomByProductId:
//            return "/merchant/products/getProductRoomByProductId"
//        case .merchantQueryComments:
//            return "/interact/comments/queryComments"
//        case .merchantListGamePlayType:
//            return "/merchant/gameplaytype/listGameplaytype"
//        case .merchantAreaRelease:
//            return "/merchant/area/arearelease"
//        case .merchantGetListGamePlayType:
//            return "/merchant/gameplaytype/getListGameplaytype"
//        case .orderCreateOrder:
//            return "/order/order/createOrder"
//        case .orderUpdateOrderGamePlayTypeById:
//            return "/order/order/updateOrdergameplaytypeById"
//        case .orderJoinOrderGamePlay:
//            return "/order/order/joinOrderGamePlay"
//        case .orderExitOrderGamePlay:
//            return "/order/order/exitOrderGamePlay"
//        case .orderHandleOrderStatus4Over:
//            return "/order/order/handleOrderStatus4Over"
//        case .orderKickingJoinOrderGamePlayUser:
//            return "/order/order/kickingJoinOrderGamePlayUser"
//        case .orderSignOrderGamePlay:
//            return "/order/order/signOrderGamePlay"
//        case .orderSetOrderStart:
//            return "/order/order/setOrderStart"
//        case .orderGetUserShopCartNumber:
//            return "/order/shopcart/getUserShopCartNumber"
//        case .orderListShopCart:
//            return "/order/shopcart/listShopCart"
//        case .merchantProductTypeListAll:
//            return "/merchant/producttype/listall"
//        case .merchantListProductsByMerchantId:
//            return "/merchant/products/listProductsByMerchantId"
//        case .orderAddShopCart:
//            return "/order/shopcart/addShopCart"
//        case .orderUpdateBuyAllJoinShopCart:
//            return "/order/shopcart/updateBuyAllJoinShopCart"
//        case .orderListOrderByUserId:
//            return "/order/order/listOrderByUserId"
//        case .orderDelOrderInfo:
//            return "/order/order/delOrderinfo"
//        case .orderComments:
//            return "/interact/comments/add"
//        case .orderGetProductRoomInfoByOrderGamePlay:
//            return "/order/order/getProductRoomInfoByOrderGamePlay"
//        case .orderGetUserOrderInfoByOrderId:
//            return "/order/order/getUserOrderInfoByOrderId"
//        case .orderUserAlreadyGotCoupon:
//            return "/order/coupon/userAlreadyGotCoupon"
//        case .orderListWaitReceiveCoupon:
//            return "/order/coupon/listWaitReceiveCoupon"
//        case .orderUserReceiveCoupon:
//            return "/order/coupon/userReceiveCoupon"
//        case .orderOrderPayMoney:
//            return "/order/paymoney/orderPayMoney"
//        case .orderMakePayInfo:
//            return "/pay/pay/makePayInfo"
//        case .orderGetPayMoneyOrderUser:
//            return "/pay/pay/getPayMoneyOrderUser"
//        case .orderMakeAliPayInfo:
//            return "/pay/alipay/makeAliPayInfo"
        case .videoSelectVideosByPage(_, _):
            return "/video/video/selectVideosByPage"
//        case .videoSelectVideosByUserInfo:
//            return "/video/video/selectVideosByUserInfo"
//        case .videoIncrementPlayCount:
//            return "/video/video/incrementPlayCount"
//        case .videoBatchAdd:
//            return "/video/video/batchAdd"
//        case .videoOSSTemporarySignature:
//            return "/upfile/ossTemporarySignature"
//        case .videoGenerateStsSecurityToken:
//            return "/upfile/generateStsSecurityToken"
//        case .videoApp2OssStsSecurityToken:
//            return "/upfile/app2OssStsSecurityToken"
//        case .videoOSSDownloadYearSig:
//            return "/upfile/ossDownloadYearSig"
        }
    }
    public var method: Moya.Method {
        switch self {
        case .zen, .showUser, .showAccounts:
            return .get
        case .createUser, .updateUser:
            return .post
            
        //Yueyu
        case .loginPhoneMsgCode, .videoSelectVideosByPage, .loginRegisterUser, .loginByPhone:
            return .post
        }
    }
    public var task: Task {
        switch self {
        case .zen, .showUser, .showAccounts: // Send no parameters
            return .requestPlain
        case let .updateUser(_, firstName, lastName):  // Always sends parameters in URL, regardless of which HTTP method is used
            return .requestParameters(parameters: ["first_name": firstName, "last_name": lastName], encoding: URLEncoding.queryString)
        case let .createUser(firstName, lastName): // Always send parameters as JSON in request body
            return .requestParameters(parameters: ["first_name": firstName, "last_name": lastName], encoding: JSONEncoding.default)
            
        case let .videoSelectVideosByPage(pageNum, pageSize):
            return .requestParameters(parameters: ["pageNum" : pageNum, "pageSize" : pageSize], encoding: JSONEncoding.default)
        case let .loginPhoneMsgCode(phonenumber, msgtype):
            return .requestParameters(parameters: ["phonenumber" : phonenumber, "msgtype" : msgtype], encoding: JSONEncoding.default)
        case let .loginRegisterUser(phonenumber, password, msgcode):
            return .requestParameters(parameters: ["phonenumber" : phonenumber, "password" : password, "msgcode" : msgcode], encoding: JSONEncoding.default)
        case let .loginByPhone(phonenumber, password, msgcode):
            return .requestParameters(parameters: ["phonenumber" : phonenumber, "password" : password, "msgcode" : msgcode], encoding: JSONEncoding.default)
        }
    }
    
//    var sampleData: Data {
//        switch self {
//        case .zen:
//            return "Half measures are as bad as nothing at all.".utf8Encoded
//        case .showUser(let id):
//            return "{\"id\": \(id), \"first_name\": \"Harry\", \"last_name\": \"Potter\"}".utf8Encoded
//        case .createUser(let firstName, let lastName):
//            return "{\"id\": 100, \"first_name\": \"\(firstName)\", \"last_name\": \"\(lastName)\"}".utf8Encoded
//        case .updateUser(let id, let firstName, let lastName):
//            return "{\"id\": \(id), \"first_name\": \"\(firstName)\", \"last_name\": \"\(lastName)\"}".utf8Encoded
//        case .showAccounts:
//            // Provided you have a file named accounts.json in your bundle.
//            guard let url = Bundle.main.url(forResource: "accounts", withExtension: "json"),
//                let data = try? Data(contentsOf: url) else {
//                    return Data()
//            }
//            return data
//        case .videoSelectVideosByPage:
//            return "{}".utf8Encoded
//        case .loginPhoneMsgCode:
//            return "{}".utf8Encoded
//        }
//    }
    public var headers: [String: String]? {
        return ["Content-type": "application/json", "Authorization" : headerToken]
    }
}


// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data { Data(self.utf8) }
}
