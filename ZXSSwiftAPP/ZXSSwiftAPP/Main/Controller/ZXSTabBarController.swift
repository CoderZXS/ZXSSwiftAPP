//
//  ZXSTabBarController.swift
//  ZXSSwiftAPP
//
//  Created by enesoon on 2020/8/14.
//  Copyright © 2020 enesoon. All rights reserved.
//

import UIKit

class ZXSTabBarController: UITabBarController {

    private var currentSelectedItemIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addAllChildVC()
    }
    
    //点击item
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //获取点击下标与当前下标比较，相同不处理，不同进行动画
        if let index = tabBar.items?.firstIndex(of: item) {
            if index != currentSelectedItemIndex {
                animationTabbarIntemForIndex(index: index)
            }
        }
    }
    
}

extension ZXSTabBarController {
    private func addAllChildVC () {
        addChildVC(childVC: ViewController(), title: "首页", image: "tabbar_report_normal", selectedImage: "tabbar_report_selected")
        addChildVC(childVC: ViewController(), title: "站点", image: "tabbar_site_normal", selectedImage: "tabbar_site_selected")
        addChildVC(childVC: ViewController(), title: "任务", image: "tabbar_task_normal", selectedImage: "tabbar_task_selected")
        addChildVC(childVC: ViewController(), title: "我的", image: "tabbar_me_normal", selectedImage: "tabbar_me_selected")
    }

    
    private func addChildVC(childVC:UIViewController, title:String, image:String, selectedImage:String) {
        childVC.tabBarItem.title = title;
        childVC.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : RGBColor(red: 49, green: 168, blue: 46)], for: .selected)
        
        let nav = UINavigationController();
        nav.addChild(childVC)
        addChild(nav)
    
    }
    
    // 实现缩放动画
    private func animationTabbarIntemForIndex(index:Int) {
        var tabBarButtons = [UIView]()
        //遍历tabbar子视图拿到可点击的item加入数组
        for tabBarButton in tabBar.subviews {
            if tabBarButton.isKind(of: NSClassFromString("UITabBarButton")!) {
                tabBarButtons.append(tabBarButton)
            }
        }
        
        //动画实现部分
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        //动画函数
        pulse.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pulse.duration = 0.1
        pulse.repeatCount = 1
        //执行完复位
        pulse.autoreverses = true
        //动画缩小的值
        pulse.fromValue = NSNumber(value: 0.7)
        //动画放大的值
        pulse.toValue = NSNumber(value: 1.2)
        tabBarButtons[index].layer.add(pulse, forKey:nil)
        
        currentSelectedItemIndex = index
    }
}
