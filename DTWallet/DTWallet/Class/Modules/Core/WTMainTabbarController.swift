//
//  WTMainTabbarController.swift
//  DTWallet
//
//  Created by 张长乐 on 2018/3/5.
//  Copyright © 2018年 张长乐. All rights reserved.
//

import UIKit

class WTMainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let mainPageNav = WTBaseNavigationViewController(rootViewController: WTMainPageViewController())
        mainPageNav.tabBarItem.title = "首页"
        let myInfoNav = WTBaseNavigationViewController(rootViewController: WTMyInfoViewController())
        myInfoNav.tabBarItem.title = "我的"

        viewControllers = [mainPageNav, myInfoNav]
        
        tabBar.isTranslucent = false
    }

}
