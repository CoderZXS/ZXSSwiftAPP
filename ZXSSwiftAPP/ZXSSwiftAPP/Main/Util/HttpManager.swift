//
//  HttpManager.swift
//  ZXSSwiftAPP
//
//  Created by enesoon on 2020/8/14.
//  Copyright © 2020 enesoon. All rights reserved.
//

import UIKit
import Alamofire

private let shareInstance = HttpManager()

enum HTTPMethodType {
    case get
    case post
}

class HttpManager: NSObject {
    
    //单例
    class var shareHttpManager : HttpManager {
        return shareInstance;
    }
}

extension HttpManager {
    func requestNetworkData(type : HTTPMethodType, URLString : String, paramater : [String : Any]?, completion : @escaping(_ response : Any) -> ()) {
        //获取请求类型
        //let method = type == .get ? HTTPMethodType.get : HTTPMethodType.post;
        
        var method = HTTPMethod.get;
        switch type {
        case .get:
            method = HTTPMethod.get

        case .post:
            method = HTTPMethod.post

        default:
            method = HTTPMethod.get;
        }

        //请求网络数据
        Alamofire.request(URLString, method: method, parameters: paramater, encoding: URLEncoding.default, headers: nil).responseJSON { (responseJson) in
            //判断请求是否成功
            guard responseJson.result.value != nil else {
                print(responseJson.result.error!);
                return
            }
            
            //获取结果
            guard responseJson.result.isSuccess else {
                return
            }
            
            //成功就把请求的数据回调回去
            if let value = responseJson.result.value {
                completion(value);
            }
            
        }
    }
}
