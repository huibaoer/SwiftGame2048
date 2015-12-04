//
//  ScoreView.swift
//  SwiftGame2048
//
//  Created by zhanght on 15/12/2.
//  Copyright © 2015年 zhanght. All rights reserved.
//

import UIKit

enum ScoreType {
    case Common //普通分数
    case Best   //最高分面板
}

protocol ScoreViewProtocol {
    func changeScore(value s:Int)
}

class ScoreView: UIView, ScoreViewProtocol {
    var label:UILabel!
    
    let defaultFrame = CGRectMake(0, 0, 100, 30)
    var stype:String!    //显示“最高分”还是“分数”
    var score:Int = 0 {
        didSet {
            //分数变化，内容标签也要变化
            label.text = "\(stype):\(score)"
        }
    }

    init(stype:ScoreType) {
        super.init(frame: defaultFrame)

        label = UILabel(frame: defaultFrame)
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont(name: "微软雅黑", size: 16)
        label.textColor = UIColor.whiteColor()
        self.addSubview(label)
        
        self.stype = (stype == ScoreType.Common ? "分数" : "最高分")
        
        backgroundColor = UIColor.orangeColor()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //实现协议里的方法
    func changeScore(value s:Int) {
        score = s
    }
}
