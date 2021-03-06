//
//  ViewController.swift
//  SwiftGame2048
//
//  Created by zhanght on 15/11/24.
//  Copyright © 2015年 zhanght. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startGame(sender: AnyObject) {
        let alertView = UIAlertView()
        alertView.title = "开始！"
        alertView.message = "游戏就要开始了，你准备好了吗？"
        alertView.addButtonWithTitle("Ready Go!")
        alertView.show()
        alertView.delegate = self
    }

    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        self.presentViewController(MainTabViewController(), animated: true, completion: nil)
    }

}

