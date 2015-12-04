//
//  MainTabViewController.swift
//  SwiftGame2048
//
//  Created by zhanght on 15/11/24.
//  Copyright © 2015年 zhanght. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var viewMain = MainViewController()
        viewMain.title = "2048"
        
        var viewSetting = SettingViewController()
        viewSetting.title = "设置"
        
        //分别设置两个视图控制器
        var main = UINavigationController(rootViewController: viewMain)
        var setting = UINavigationController(rootViewController: viewSetting)
        
        self.viewControllers = [main, setting]
        
        //默认选中的是游戏主界面视图
        self.selectedIndex = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
