//
//  GameModel.swift
//  SwiftGame2048
//
//  Created by zhanght on 15/12/4.
//  Copyright © 2015年 zhanght. All rights reserved.
//

import UIKit

class GameModel: NSObject {
    var dimension:Int = 0
    var tiles:Array<Int>
    
    //由外部传来维度值
    init(dimension:Int) {
        self.dimension = dimension
        self.tiles = Array<Int>(count: self.dimension * self.dimension, repeatedValue: 0)
    }
    
    //找出空位置
    func emptyPositions() -> [Int] {
        var emptyTiles = Array<Int>()
        for i in 0..<(dimension*dimension) {
            if (tiles[i] == 0) {
                emptyTiles.append(i)
            }
        }
        return emptyTiles
    }
    
    //位置是否满了
    func isFull() -> Bool {
        if (emptyPositions().count == 0) {
            return true
        }
        return false
    }
    
    //输出当前数据模型
    func printTiles() {
        print(tiles)
        print("输出数据模型\n")
        let count = tiles.count
        for var i=0; i<count; i++ {
            if (i+1) % Int(dimension) == 0 {
                print(tiles[i])
            } else {
                print("\(tiles[i])\t")
            }
        }
        print("\n")
    }
    
    //如果返回false，表示该位置已经有值
    func setPosition(row: Int, col: Int, value: Int) -> Bool {
        assert(row>=0 && row<dimension)
        assert(col>=0 && col<dimension)
        
        //3行4列，即 row=2, col=3 index=2*4+3=11
        //4行4列，即 row=3, col=3 index=3*4+3=15
        var index = self.dimension * row + col
        var val = tiles[index]
        if val > 0 {
            print("该位置（\(row), \(col)）已经有值了")
            return false
        }
        tiles[index] = value
        return true
    }
}













