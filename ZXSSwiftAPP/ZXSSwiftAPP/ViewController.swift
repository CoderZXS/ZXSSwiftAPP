//
//  ViewController.swift
//  ZXSSwiftAPP
//
//  Created by enesoon on 2020/8/14.
//  Copyright © 2020 enesoon. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let URLString = "http://test.huizustore.com:9000/consumer-app/aliPay/orderComplaints/orderComplaintsGetById?id=10"
        HttpManager.shareHttpManager.requestNetworkData(type: .get, URLString: URLString, paramater: nil) { (response) in
            let jsonData = JSON(response)
            print("jsonData = \(jsonData)")
        }
    }
}

