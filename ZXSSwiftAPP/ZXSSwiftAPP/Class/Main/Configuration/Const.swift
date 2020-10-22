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
/// emoji 宽度
let kEmojiItemW = kScreenW / 7.0

let kKeyWindow = UIApplication.shared.keyWindow;

//是否iPhoene
let kIsIphone = Bool(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone)

//是否iPhoneX
let kIsIphoneX = Bool(kScreenW >= 375.0 && kScreenH >= 812.0 && kIsIphone)

//导航栏高度
let kNavigationBarH = CGFloat(kIsIphoneX ? 88 : 64)

//状态栏
let kStatusBarH = CGFloat(kIsIphoneX ? 44 : 20)

//tabbar
let kTabBarH = CGFloat(kIsIphoneX ? 83 : 49)

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

//圆角
func CustomLayerCoreRadius(num : CGFloat) -> CGFloat {
    //刘海屏
    guard kScreenH <= 736.0 else {
        return num * 1.3
    }
    
    //5.5
    guard kScreenH == 736.0 else {
        return num * 1.1
    }
    
    //4.7
    guard kScreenH >= 736.0 else {
        return num
    }
    
    //其他
    return num * 1.2
}
