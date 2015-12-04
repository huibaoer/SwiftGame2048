//
//  SettingViewController.swift
//  SwiftGame2048
//
//  Created by zhanght on 15/11/24.
//  Copyright © 2015年 zhanght. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITextFieldDelegate {
    
    var txtNum:UITextField!
    var segDimension:UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        self.setupControls()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupControls() {
        //创建文本输入框
        txtNum = ViewFactory.createTextField("", action: Selector("numChanged"), sender: self)
        txtNum.frame = CGRectMake(80, 100, 200, 30)
        txtNum.returnKeyType = UIReturnKeyType.Done
        self.view.addSubview(txtNum)
        
        let labelNum = ViewFactory.createLabel("阀值:")
        labelNum.frame = CGRect(x: 20, y: 100, width: 60, height: 30)
        self.view.addSubview(labelNum)
        
        //创建分段单选控件
        segDimension = ViewFactory.createSegment(["3x3", "4x4", "5x5"], action: "dimensionChanged:", sender: self)
        segDimension.frame = CGRectMake(80, 200, 200, 30)
        self.view.addSubview(segDimension)
        segDimension.selectedSegmentIndex = 1
        
        let labelDm = ViewFactory.createLabel("维度:")
        labelDm.frame = CGRect(x: 20, y: 200, width: 60, height: 30)
        self.view.addSubview(labelDm)
    }
    
    func numChanged() {
        
    }
    
    func dimensionChanged(sender: AnyObject) {
        
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
