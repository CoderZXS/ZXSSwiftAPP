//
//  Const.swift
//  SwiftAPP
//
//  Created by enesoon on 2020/8/14.
//  Copyright © 2020 enesoon. All rights reserved.
//

import UIKit

let kScreenW = UIScreen.main.bounds.width;
let kScreenH = UIScreen.main.bounds.height;

let kKeyWindow = UIApplication.shared.keyWindow;

//是否iPhoene
let kIsiPhone = Bool(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone)

//是否iPhoneX
let kIsiPhoneX = Bool(kScreenW >= 375.0 && kScreenH >= 812.0 && kIsiPhone)

//导航栏高度
let kNavigationBarH = CGFloat(kIsiPhoneX ? 88 : 64)

//状态栏
let kStatusBarH = CGFloat(kIsiPhoneX ? 44 : 20)

//tabbar
let kTabBarH = CGFloat(kIsiPhoneX ? 83 : 49)



//自定义颜色
func RGBColor(red:CGFloat, green:CGFloat, blue:CGFloat) -> UIColor {
    return UIColor.init(red: (red / 255.0), green: (green / 255.0), blue: (blue / 255.0), alpha: 1.0)
}

//字号
func CustomFont(font:CGFloat) -> UIFont {
    //刘海屏
    guard kScreenH <= 736.0 else {
        return UIFont.systemFont(ofSize: font)
    }
    
    //5.5
    guard kScreenH == 736.0 else {
        return UIFont.systemFont(ofSize: font - 2)
    }
    
    //4.7
    guard kScreenH >= 736.0 else {
        return UIFont.systemFont(ofSize: font - 4)
    }
    
    //其他
    return UIFont.systemFont(ofSize: font)
}






