//
//  MainViewController.swift
//  SwiftGame2048
//
//  Created by zhanght on 15/11/24.
//  Copyright © 2015年 zhanght. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    //游戏方格维度
    var dimension:Int = 4
    //游戏过关最大值
    var maxnumber:Int = 2048
    
    //数字格子的宽度
    var width:CGFloat = 50
    //格子与格子的间距
    var padding:CGFloat = 6
    
    //保存背景图数据
    var backgrounds:Array<UIView>!
    
    var score:ScoreView!
    var bestScore:ScoreView!
    
    var gmodel:GameModel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        self.backgrounds = Array<UIView>()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.backgrounds = Array<UIView>()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.setupGameMap()
        self.setupScoreLabels()
        
        self.gmodel = GameModel(dimension: self.dimension)
        
        for i in 0..<2
        {
            genNumber()
        }
    }
    
    func setupGameMap() {
        var x:CGFloat = 50
        var y:CGFloat = 150
        
        for i in 0..<dimension {
            print(i)
            y = 150
            for j in 0..<dimension {
                //初始化视图
                var background = UIView(frame: CGRectMake(x, y, width, width))
                background.backgroundColor = UIColor.darkGrayColor()
                self.view.addSubview(background)
                
                //将视图保存起来，以备后用
                backgrounds.append(background)
                y += padding + width
            }
            x += padding + width
        }
    }
    
    func setupScoreLabels() {
        score = ScoreView(stype: ScoreType.Common)
        score.frame.origin = CGPointMake(50, 80)
        score.changeScore(value: 0)
        self.view.addSubview(score)
        
        bestScore = ScoreView(stype: ScoreType.Best)
        bestScore.frame.origin = CGPointMake(170, 80)
        bestScore.changeScore(value: 0)
        self.view.addSubview(bestScore)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //生成随机的数字
    func genNumber() {
        //用于确定随机的概率
        let randv = Int(arc4random_uniform(10))
        print(randv)
        
        var seed:Int = 2
        //因为有10%的机会出现1，所以这里的10%的机会给4
        if randv == 1 {
            seed = 4
        }
        
        //随机生成行号和列号
        let col = Int(arc4random_uniform(UInt32(dimension)))
        let row = Int(arc4random_uniform(UInt32(dimension)))
        
        if gmodel.isFull() {
            print("位置已经满了")
            return
        }
        if gmodel.setPosition(row, col: col, value: seed) == false {
            genNumber()
            return
        }
        
        //执行后续操作
        self.insertTile((col, row), value: seed)
    }
    
    //插入瓦片
    func insertTile(pos: (Int, Int), value: Int) {
        let (row, col) = pos
        
        let x = 50 + CGFloat(col) * (width + padding)
        let y = 150 + CGFloat(row) * (width + padding)
        
        let tile = TileView(pos: CGPoint(x: x, y: y), width: width, value: value)
        self.view.addSubview(tile)
        self.view.bringSubviewToFront(tile)
    }

}
