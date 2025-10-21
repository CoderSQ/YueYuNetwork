//
//  ServicesInfo.swift
//  Mahjong
//
//  Created by zsq on 2025/10/14.
//

import Foundation

import Foundation


//  YueYu 相关常量
struct ServicesInfo {
   
    // URL 相关常量
    static let SCHEME = "yueyu"
    static let HOST = "www.yueyu.com"
    static let BASE_URI = "\(SCHEME)://\(HOST)"
    static let QR_PATH = "/qr"
    static let PLAY_ROOM_PATH = "/playRoom"
    static let QR = "\(BASE_URI)/qr/"
    static let ERROR = "\(BASE_URI)/error/"
    
    // 参数相关常量
    static let QUERY_ORDER_ID = "orderId"
    static let WX_APP_ID = "wxb4e9f2dba65ae351"
    
    // 分享相关常量
    static let KEY_BITMAP = "key_bitmap"
    static let KEY_URL = "key_url"
    static let KEY_TITLE = "key_title"
    static let KEY_DES = "key_des"
}


// API 地址常量
struct APIS {
    static let LOGIN_YY_PHONE_MSGCODE = "yyserver/auth/yyphonemsgcode"
    static let LOGIN_YY_REGISTER_USER = "yyserver/auth/yyregisteruser"
    static let LOGIN_YY_LOGIN_BYPHONE = "yyserver/auth/yyloginbyphone"
    static let LOGIN_YY_LOGIN_BYWX = "yyserver/auth/yywechatcallback"
    static let LOGIN_YY_LOGIN_UNBIND_WX = "yyserver/auth/yyUnbindWxopenid"
    static let LOGIN_YY_LOGIN_BIND_WX_OPEN_ID = "yyserver/auth/yyloginbindwxopenid"
    static let LOGIN_YY_GET_USERINFO = "yyserver/yy-user/userinfo/userinfobyphonenumber"
    static let YY_SEARCH_USERINFO_BY_PHONENAMEE = "yyserver/user/userinfo/searchUserInfoByPhoneName"
    static let USERINFO_YY_UPDATEUSERINFOBYTXIMID = "yyserver/yy-user/userinfo/updateUserInfoByTximId"
    static let USERINFO_YY_HANDLETXIMUSERSIGNTXT = "yyserver/user/userinfo/handleTXIMUserSignTxt"
    static let LOGIN_YY_REFRESH = "yyserver/auth/yyrefresh"
    static let YY_APK_DOWNURL = "yyserver/platform/platform/apkDownUrl"
    static let LOGIN_YY_LOGOUT = "yyserver/auth/yylogout"
    static let MERCHANT_YY_LISTMERCHANTINFO = "yyserver/merchant/merchant/listmerchantinfo"
    static let MERCHANT_YY_QUERYMERCHANTS = "/yyserver/merchant/merchant/queryMerchants"
    static let MERCHANT_YY_MERCHANT_PRODUCTS_BY_MERCHANTID = "yyserver/merchant/merchant/getMerchantProductsByMerchantId"
    static let MERCHANT_YY_MERCHANT_COLLECTS_ADD = "yyserver/interact/collects/add"
    static let MERCHANT_YY_MERCHANT_COLLECTS_CANCEL = "yyserver/interact/collects/cancel"
    static let MERCHANT_YY_MERCHANT_COLLECTS_LIST = "yyserver/interact/collects/myCollects"
    static let MERCHANT_YY_GETMERCHANTBYCOUPONCODE = "yyserver/merchant/merchant/getMerchantByCouponCode"
    static let MERCHANT_YY_MERCHANT_PRODUCTS_LISTORDERGAMEPLAYROOM = "yyserver/merchant/products/listOrderGamePlayRoom"
    static let MERCHANT_YY_MERCHANT_PRODUCTROOM_BY_PRODUCTID = "yyserver/merchant/products/getProductRoomByProductId"
    static let MERCHANT_YY_MERCHANT_QUERYCOMMENTS = "yyserver/interact/comments/queryComments"
    static let MERCHANT_YY_LISTGAMEPLAYTYPE = "yyserver/merchant/gameplaytype/listGameplaytype"
    static let MERCHANT_YY_AREARELEASE = "yyserver/merchant/area/arearelease"
    static let MERCHANT_YY_GETLISTGAMEPLAYTYPE = "yyserver/merchant/gameplaytype/getListGameplaytype"
    static let ORDER_YY_ORDER_CREATEORDER = "yyserver/order/order/createOrder"
    static let ORDER_YY_ORDER_UPDATEORDERGAMEPLAYTYPE_BY_ID = "yyserver/order/order/updateOrdergameplaytypeById"
    static let ORDER_YY_ORDER_JOINORDERGAMEPLAY = "yyserver/order/order/joinOrderGamePlay"
    static let ORDER_YY_ORDER_EXITORDERGAMEPLAY = "yyserver/order/order/exitOrderGamePlay"
    static let ORDER_YY_ORDER_HANDLEORDERSTATUS40VER = "yyserver/order/order/handleOrderStatus4Over"
    static let ORDER_YY_ORDER_KICKINGJOINORDERGAMEPLAYUSER = "yyserver/order/order/kickingJoinOrderGamePlayUser"
    static let ORDER_YY_ORDER_SIGNORDERGAMEPLAY = "yyserver/order/order/signOrderGamePlay"
    static let ORDER_YY_SETORDERSTART = "/yyserver/order/order/setOrderStart"
    static let ORDER_YY_GETUSERSHOPCARTNUMBER = "yyserver/order/shopcart/getUserShopCartNumber"
    static let ORDER_YY_LISTSHOPCART = "yyserver/order/shopcart/listShopCart"
    static let MERCHANT_YY_PRODUCTTYPE_LISTALL = "yyserver/merchant/producttype/listall"
    static let MERCHANT_YY_LISTPRODUCTS_BY_MERCHANTID = "yyserver/merchant/products/listProductsByMerchantId"
    static let MERCHANT_YY_ORDER_BY_ADDSHOPCART = "yyserver/order/shopcart/addShopCart"
    static let MERCHANT_YY_ORDER_UPDATEBUYALLJOINSHOPCART = "yyserver/order/shopcart/updateBuyAllJoinShopCart"
    static let MERCHANT_YY_ORDER_LISTORDERBYUSERID = "yyserver/order/order/listOrderByUserId"
    static let MERCHANT_YY_ORDER_DELORDERINFO = "yyserver/order/order/delOrderinfo"
    static let MERCHANT_YY_ORDER_COMMENTS = "yyserver/interact/comments/add"
    static let MERCHANT_YY_ORDER_GET_PRODUCTROOMINFOBYORDERGAMEPLAY = "yyserver/order/order/getProductRoomInfoByOrderGamePlay"
    static let MERCHANT_YY_ORDER_GETUSERORDERINFOBYORDERID = "yyserver/order/order/getUserOrderInfoByOrderId"
    static let MERCHANT_YY_USERALREADYGOTCOUPON = "yyserver/order/coupon/userAlreadyGotCoupon"
    static let MERCHANT_YY_LISTWAITRECEIVECOUPON = "/yyserver/order/coupon/listWaitReceiveCoupon"
    static let MERCHANT_YY_USERRECEIVECOUPON = "yyserver/order/coupon/userReceiveCoupon"
    static let MERCHANT_YY_ORDER_ORDERPAYMONEY = "yyserver/order/paymoney/orderPayMoney"
    static let MERCHANT_YY_ORDER_MAKEPAYINFO = "yyserver/pay/pay/makePayInfo"
    static let MERCHANT_YY_ORDER_GETPAYMONEYORDERUSER = "yyserver/pay/pay/getPayMoneyOrderUser"
    static let MERCHANT_YY_ORDER_MAKE_ALIPAYINFO = "yyserver/pay/alipay/makeAliPayInfo"
    static let VIDEO_YY_SELECTVIDEOSBYPAGE = "yyserver/video/video/selectVideosByPage"
    static let VIDEO_YY_SELECTVIDEOSBYUSERINFO = "yyserver/video/video/selectVideosByUserInfo"
    static let VIDEO_YY_INCREMENTPLAYCOUNT = "yyserver/video/video/incrementPlayCount"
    static let VIDEO_YY_BATCHADD = "/yyserver/video/video/batchAdd"
    static let VIDEO_YY_OSSTEMPORARYSIGNATURE = "yyserver/upfile/ossTemporarySignature"
    static let VIDEO_YY_GENERATESTSSECURITYTOKEN = "yyserver/upfile/generateStsSecurityToken"
    static let VIDEO_YY_APP2OSSSTSSECURITYTOKEN = "yyserver/upfile/app2OssStsSecurityToken"
    static let VIDEO_YY_OSSDOWNLOADYEARSIG = "yyserver/upfile/ossDownloadYearSig"
}


// 数据存储键名常量
struct DataKeys {
    static let KEY_USER_AGREEMENT = "userAgreement"
    static let KEY_LOGIN_USER_INFO = "loginUserInfo"
    static let KEY_DEVICE_NO = "deviceNo"
    static let KEY_PHONE_NO = "phoneNo"
    static let KEY_LOGIN_STATE = "loginState"
    static let KEY_SESSION_TOKEN = "sessionToken"
    static let KEY_USER_CODE = "userCode"
    static let KEY_ACCESS_TOKEN = "accessToken"
    static let KEY_NICK_NAME = "nickName"
    static let KEY_LAT = "lat"
    static let KEY_LOG = "log"
    static let KEY_PROVINCE = "province"
    static let KEY_CITY = "city"
    static let KEY_DISTRICT = "district"
    static let KEY_PROVINCE_ID = "province_id"
    static let KEY_CITY_ID = "city_id"
    static let KEY_DISTRICT_ID = "district_id"
    static let KEY_CHECK_CITY = "check_city"
    static let KEY_ADDRESS = "`address`"
}
