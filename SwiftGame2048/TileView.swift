//
//  TileView.swift
//  SwiftGame2048
//
//  Created by zhanght on 15/12/4.
//  Copyright © 2015年 zhanght. All rights reserved.
//

import UIKit

class TileView: UIView {
    //颜色映射表，不同的数字颜色不同
    let colorMap = [
        2:UIColor.redColor(),
        4:UIColor.orangeColor(),
        8:UIColor.yellowColor(),
        16:UIColor.greenColor(),
        32:UIColor.brownColor(),
        64:UIColor.blueColor(),
        128:UIColor.purpleColor(),
        256:UIColor.cyanColor(),
        512:UIColor.lightGrayColor(),
        1024:UIColor.magentaColor(),
        2048:UIColor.blackColor()
    ]
    
    //设置值时，更新视图背景和文字
    var value:Int = 0 {
        didSet {
            backgroundColor = colorMap[value]
            numberLabel.text = "\(value)"
        }
    }
    
    var numberLabel:UILabel!
    
    //初始化视图
    init(pos: CGPoint, width: CGFloat, value: Int) {
        super.init(frame: CGRect(x: pos.x, y: pos.y, width: width, height: width))

        numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: width))
        numberLabel.textColor = UIColor.whiteColor()
        numberLabel.textAlignment = NSTextAlignment.Center
        numberLabel.minimumScaleFactor = 0.5
        numberLabel.font = UIFont(name: "微软雅黑", size: 20)
        numberLabel.text = "\(value)"
        self.addSubview(numberLabel)
        self.value = value
        self.backgroundColor = colorMap[value]
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    

}








