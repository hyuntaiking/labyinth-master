//
//  stageViewDraw.swift
//  Labyinth
//
//  Created by 陳信毅 on 2017/7/20.
//  Copyright © 2017年 hyphen. All rights reserved.
//

import Foundation
import UIKit

private let app = UIApplication.shared.delegate as! AppDelegate

func chapter1(view:UIView) {
    // 背景
    UIGraphicsBeginImageContext(view.frame.size)
    UIImage(named: "background")?.draw(in: view.bounds)
    
    let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    
    UIGraphicsEndImageContext()
    
    view.backgroundColor = UIColor(patternImage: image)
    
    // 關卡
    app.stages.append(Stage(name: "stage1_1",
                        frame: CGRect(x: view.frame.width*4.4/6.8,
                                      y: view.frame.height*9.5/12.1,
                                      width: view.frame.width*64/375,
                                      height: view.frame.width*64/375)))
    app.stages.append(Stage(name: "stage1_2",
                        frame: CGRect(x: view.frame.width*3.4/6.8,
                                      y: view.frame.height*7.5/12.1,
                                      width: view.frame.width*64/375,
                                      height: view.frame.width*64/375)))
    app.stages.append(Stage(name: "stage1_3",
                        frame: CGRect(x: view.frame.width*4/6.8,
                                      y: view.frame.height*5.4/12.1,
                                      width: view.frame.width*64/375,
                                      height: view.frame.width*64/375)))
    app.stages.append(Stage(name: "stage1_4",
                        frame: CGRect(x: view.frame.width*4.2/6.8,
                                      y: view.frame.height*3.4/12.1,
                                      width: view.frame.width*64/375,
                                      height: view.frame.width*64/375)))
    app.stages.append(Stage(name: "stage1_5",
                        frame: CGRect(x: view.frame.width*3/6.8,
                                      y: view.frame.height*1.3/12.1,
                                      width: view.frame.width*64/375,
                                      height: view.frame.width*64/375)))
    // app.ball
    app.ball = Ball(image: UIImage(named: "monkey")!)
    app.ball.frame.size = CGSize(width: view.frame.width*64/375, height: view.frame.width*64/375)
    app.ball.center.x = view.frame.width * 2.5/12.1
    app.ball.center.y = view.frame.width * 2.5/6.8
    // 背景音樂
    playSound(name: "chapter1", numberOfLoops: -1)
}


func stage1_1(view:UIView){
    view.backgroundColor = UIColor.white
    app.ball = nil
    app.ball = Ball(image: UIImage(named: "ball")!)
    app.ball.frame.size = CGSize(width: view.frame.width*32/375, height: view.frame.width*32/375)
    // app.ball的位置
    app.ball.center.x = view.frame.width * 4/5
    app.ball.center.y = view.frame.height * 1/7
    
    app.ball.start = app.ball.center
    
    // 牆
    app.walls.append(CGRect(x: view.frame.width*1.8/7, y: view.frame.height*2.2/10, width: view.frame.width * 5.2/7, height: view.frame.height * 0.5/10))
    app.walls.append(CGRect(x: 0, y: view.frame.height*4.5/10, width: view.frame.width * 3.6/7, height: view.frame.height * 0.5/10))
    app.walls.append(CGRect(x: view.frame.width*5/7, y: view.frame.height*4.5/10, width: view.frame.width * 2/7, height: view.frame.height * 0.5/10))
    app.walls.append(CGRect(x: view.frame.width*1.8/7, y: view.frame.height*6.9/10, width: view.frame.width * 5.2/7, height: view.frame.height * 0.5/10))
    
    // 洞
    let holeside = view.frame.width*32/375
    app.holes.append(CGRect(x: view.frame.width*1/7, y: view.frame.height*0.8/10, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*1/7, y: view.frame.height*3.7/10, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*4.5/7, y: view.frame.height*3/10, width:holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*4/7, y: view.frame.height*5.7/10, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*2/7, y: view.frame.height*8.5/10, width: holeside, height: holeside))
    
    // 目標
    app.goals.append(CGRect(x: view.frame.width*5/7, y: view.frame.height*8.2/10, width: holeside, height: holeside))
}

func stage1_2(view:UIView){
    view.backgroundColor = UIColor.white
    app.ball = nil
    app.ball = Ball(image: UIImage(named: "ball")!)
    app.ball.frame.size = CGSize(width: view.frame.width*32/375, height: view.frame.width*32/375)
    // app.ball的位置
    app.ball.center.x = view.frame.width * 0.8/6.8
    app.ball.center.y = view.frame.height * 0.8/12.1
    
    app.ball.start = app.ball.center
    
    app.walls.append(CGRect(x: view.frame.width*0/7, y: view.frame.height*0/10, width: view.frame.width * 7/7, height: view.frame.height * 0.4/10))
    app.walls.append(CGRect(x: view.frame.width*0/7, y: view.frame.height*9.6/10, width: view.frame.width * 7/7, height: view.frame.height * 0.4/10))
    app.walls.append(CGRect(x: view.frame.width*0/7, y: view.frame.height*0/10, width: view.frame.width * 0.4/7, height: view.frame.height * 10/10))
    app.walls.append(CGRect(x: view.frame.width*6.6/7, y: view.frame.height*0/10, width: view.frame.width * 0.4/7, height: view.frame.height * 10/10))
    app.walls.append(CGRect(x: view.frame.width*1.4/7, y: view.frame.height*0/10, width: view.frame.width * 0.35/7, height: view.frame.height * 8.8/10))
    app.walls.append(CGRect(x: view.frame.width*1.4/7, y: view.frame.height*8.45/10, width: view.frame.width * 4.3/7, height: view.frame.height * 0.35/10))
    app.walls.append(CGRect(x: view.frame.width*2.8/7, y: view.frame.height*1.2/10, width: view.frame.width * 2.9/7, height: view.frame.height * 0.35/10))
    app.walls.append(CGRect(x: view.frame.width*5.35/7, y: view.frame.height*1.2/10, width: view.frame.width * 0.35/7, height: view.frame.height * 7.6/10))
    app.walls.append(CGRect(x: view.frame.width*2.8/7, y: view.frame.height*1.2/10, width: view.frame.width * 0.34/7, height: view.frame.height * 6.2/10))
    app.walls.append(CGRect(x: view.frame.width*2.8/7, y: view.frame.height*7.05/10, width: view.frame.width * 1.6/7, height: view.frame.height * 0.35/10))
    app.walls.append(CGRect(x: view.frame.width*4.1/7, y: view.frame.height*2.6/10, width: view.frame.width * 0.35/7, height: view.frame.height * 4.8/10))
    
    let holeside = view.frame.width*32/375
    app.holes.append(CGRect(x: view.frame.width*0.5/7, y: view.frame.height*9.1/10, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*6.0/7, y: view.frame.height*9.1/10, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*6.0/7, y: view.frame.height*0.4/10, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*1.8/7, y: view.frame.height*0.4/10, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*1.8/7, y: view.frame.height*7.8/10, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*4.7/7, y: view.frame.height*7.8/10, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*4.7/7, y: view.frame.height*1.6/10, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*3.2/7, y: view.frame.height*1.6/10, width: holeside, height: holeside))
    
    // 目標
    app.goals.append(CGRect(x: view.frame.width*3.3/7, y: view.frame.height*6.4/10, width: holeside, height: holeside))
}
func stage1_3(view:UIView) {
    // 背景
    UIGraphicsBeginImageContext(view.frame.size)
    UIImage(named: "background1_1")?.draw(in: view.bounds)
    
    let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    
    UIGraphicsEndImageContext()
    
    view.backgroundColor = UIColor(patternImage: image)
    
    // Monkey
    app.ball = nil
    app.ball = Ball(image: UIImage(named: "monkey ball")!)
    app.ball.frame.size = CGSize(width: view.frame.width*42/375, height: view.frame.width*42/375)
    app.ball.frame.origin.x = view.frame.width * 0/6
    app.ball.frame.origin.y = view.frame.height * 10.3/11
    
    app.ball.start = app.ball.center
    
    // Wall
    for i in 0...9 {
        let wall = UIImageView(image: UIImage(named: "wall"))
        wall.frame.size = CGSize(width: view.frame.width*64/375, height: view.frame.width*64/375)
        wall.frame.origin.x = 0
        wall.frame.origin.y = view.frame.height * CGFloat(i)/11
        app.wall2s.append(wall)
    }
    for i in [0, 1, 2, 3, 4, 5, 9] {
        let wall = UIImageView(image: UIImage(named: "wall"))
        wall.frame.size = CGSize(width: view.frame.width*64/375, height: view.frame.width*64/375)
        wall.frame.origin.x = view.frame.width  * CGFloat(1)/6
        wall.frame.origin.y = view.frame.height * CGFloat(i)/11
        app.wall2s.append(wall)
    }
    for i in [5, 7, 9] {
        let wall = UIImageView(image: UIImage(named: "wall"))
        wall.frame.size = CGSize(width: view.frame.width*64/375, height: view.frame.width*64/375)
        wall.frame.origin.x = view.frame.width  * CGFloat(2)/6
        wall.frame.origin.y = view.frame.height * CGFloat(i)/11
        app.wall2s.append(wall)
    }
    for i in [3, 5, 7, 9] {
        let wall = UIImageView(image: UIImage(named: "wall"))
        wall.frame.size = CGSize(width: view.frame.width*64/375, height: view.frame.width*64/375)
        wall.frame.origin.x = view.frame.width  * CGFloat(3)/6
        wall.frame.origin.y = view.frame.height * CGFloat(i)/11
        app.wall2s.append(wall)
    }
    for i in [0, 1, 2, 3, 7, 9] {
        let wall = UIImageView(image: UIImage(named: "wall"))
        wall.frame.size = CGSize(width: view.frame.width*64/375, height: view.frame.width*64/375)
        wall.frame.origin.x = view.frame.width  * CGFloat(4)/6
        wall.frame.origin.y = view.frame.height * CGFloat(i)/11
        app.wall2s.append(wall)
    }
    for i in 0...7 {
        let wall = UIImageView(image: UIImage(named: "wall"))
        wall.frame.size = CGSize(width: view.frame.width*64/375, height: view.frame.width*64/375)
        wall.frame.origin.x = view.frame.width  * CGFloat(5)/6
        wall.frame.origin.y = view.frame.height * CGFloat(i)/11
        app.wall2s.append(wall)
    }
    
    // 桃子
    var peach = UIImageView(image: UIImage(named: "peach"))
    peach.frame.size = CGSize(width: view.frame.width*56/375, height: view.frame.width*56/375)
    peach.frame.origin.x = view.frame.width  * CGFloat(5)/6
    peach.frame.origin.y = view.frame.height * CGFloat(10)/11
    app.peachs.append(peach)
    
    peach = UIImageView(image: UIImage(named: "peach"))
    peach.frame.size = CGSize(width: view.frame.width*56/375, height: view.frame.width*56/375)
    peach.frame.origin.x = view.frame.width  * CGFloat(1)/6
    peach.frame.origin.y = view.frame.height * CGFloat(6)/11
    app.peachs.append(peach)
    
    peach = UIImageView(image: UIImage(named: "peach"))
    peach.frame.size = CGSize(width: view.frame.width*56/375, height: view.frame.width*56/375)
    peach.frame.origin.x = view.frame.width  * CGFloat(3)/6
    peach.frame.origin.y = view.frame.height * CGFloat(1)/11
    app.peachs.append(peach)
    
    // 目標
    let goal = UIImageView(image: UIImage(named: "closed-door"))
    goal.frame.size = CGSize.zero
    //goal.frame.size = CGSize(width: view.frame.width*56/375, height: view.frame.width*56/375)
    goal.frame.origin.x = view.frame.width  * CGFloat(3)/6
    goal.frame.origin.y = view.frame.height * CGFloat(2)/11
    app.goal2s.append(goal)
}
func stage1_4(view:UIView) {
    // 背景
    UIGraphicsBeginImageContext(view.frame.size)
    UIImage(named: "background1_1")?.draw(in: view.bounds)
    
    let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    
    UIGraphicsEndImageContext()
    
    view.backgroundColor = UIColor(patternImage: image)
    
    // Monkey
    app.ball = nil
    app.ball = Ball(image: UIImage(named: "monkey ball")!)
    app.ball.frame.size = CGSize(width: view.frame.width*42/375, height: view.frame.width*42/375)
    app.ball.frame.origin.x = view.frame.width * 5/6
    app.ball.frame.origin.y = view.frame.height * 0/11
    
    app.ball.start = app.ball.center
    
    // Wall
    for i in [1, 2, 3, 7, 8, 9] {
        let wall = UIImageView(image: UIImage(named: "wall"))
        wall.frame.size = CGSize(width: view.frame.width*64/375, height: view.frame.width*64/375)
        wall.frame.origin.x = view.frame.width  * CGFloat(1)/6
        wall.frame.origin.y = view.frame.height * CGFloat(i)/11
        app.wall2s.append(wall)
    }
    for i in [4, 6] {
        let wall = UIImageView(image: UIImage(named: "wall"))
        wall.frame.size = CGSize(width: view.frame.width*64/375, height: view.frame.width*64/375)
        wall.frame.origin.x = view.frame.width  * CGFloat(2)/6
        wall.frame.origin.y = view.frame.height * CGFloat(i)/11
        app.wall2s.append(wall)
    }
    for i in [4, 6] {
        let wall = UIImageView(image: UIImage(named: "wall"))
        wall.frame.size = CGSize(width: view.frame.width*64/375, height: view.frame.width*64/375)
        wall.frame.origin.x = view.frame.width  * CGFloat(3)/6
        wall.frame.origin.y = view.frame.height * CGFloat(i)/11
        app.wall2s.append(wall)
    }
    for i in [1, 2, 3, 7, 8, 9] {
        let wall = UIImageView(image: UIImage(named: "wall"))
        wall.frame.size = CGSize(width: view.frame.width*64/375, height: view.frame.width*64/375)
        wall.frame.origin.x = view.frame.width  * CGFloat(4)/6
        wall.frame.origin.y = view.frame.height * CGFloat(i)/11
        app.wall2s.append(wall)
    }
    
    // 桃子
    var peach = UIImageView(image: UIImage(named: "peach"))
    peach.frame.size = CGSize(width: view.frame.width*56/375, height: view.frame.width*56/375)
    peach.frame.origin.x = view.frame.width  * CGFloat(2)/6
    peach.frame.origin.y = view.frame.height * CGFloat(3)/11
    app.peachs.append(peach)
    
    peach = UIImageView(image: UIImage(named: "peach"))
    peach.frame.size = CGSize(width: view.frame.width*56/375, height: view.frame.width*56/375)
    peach.frame.origin.x = view.frame.width  * CGFloat(2)/6
    peach.frame.origin.y = view.frame.height * CGFloat(7)/11
    app.peachs.append(peach)
    
    peach = UIImageView(image: UIImage(named: "peach"))
    peach.frame.size = CGSize(width: view.frame.width*56/375, height: view.frame.width*56/375)
    peach.frame.origin.x = view.frame.width  * CGFloat(5)/6
    peach.frame.origin.y = view.frame.height * CGFloat(5)/11
    app.peachs.append(peach)
    
    // 洞
    let holeside = view.frame.width*48/375
    app.holes.append(CGRect(x: view.frame.width*2.1/6, y: view.frame.height*2.1/11, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*2.1/6, y: view.frame.height*8.1/11, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*3.1/6, y: view.frame.height*5.1/11, width: holeside, height: holeside))
    
    // 妖怪
    var monstrer = UIImageView(image: UIImage(named: "trap"))
    monstrer.frame.size = CGSize(width: view.frame.width*48/375, height: view.frame.width*48/375)
    monstrer.frame.origin.x = view.frame.width * CGFloat(1.1)/6
    monstrer.frame.origin.y = view.frame.height * CGFloat(4.1)/11
    app.monsters.append(monstrer)
    
    monstrer = UIImageView(image: UIImage(named: "trap"))
    monstrer.frame.size = CGSize(width: view.frame.width*48/375, height: view.frame.width*48/375)
    monstrer.frame.origin.x = view.frame.width * CGFloat(1.1)/6
    monstrer.frame.origin.y = view.frame.height * CGFloat(6.1)/11
    app.monsters.append(monstrer)
    
    monstrer = UIImageView(image: UIImage(named: "trap"))
    monstrer.frame.size = CGSize(width: view.frame.width*48/375, height: view.frame.width*48/375)
    monstrer.frame.origin.x = view.frame.width * CGFloat(4.1)/6
    monstrer.frame.origin.y = view.frame.height * CGFloat(4.1)/11
    app.monsters.append(monstrer)
    
    monstrer = UIImageView(image: UIImage(named: "trap"))
    monstrer.frame.size = CGSize(width: view.frame.width*48/375, height: view.frame.width*48/375)
    monstrer.frame.origin.x = view.frame.width * CGFloat(4.1)/6
    monstrer.frame.origin.y = view.frame.height * CGFloat(6.1)/11
    app.monsters.append(monstrer)
    
    // 目標
    let goal = UIImageView(image: UIImage(named: "closed-door"))
    goal.frame.size = CGSize.zero
    //goal.frame.size = CGSize(width: view.frame.width*48/375, height: view.frame.width*48/375)
    goal.frame.origin.x = view.frame.width  * CGFloat(2)/6
    goal.frame.origin.y = view.frame.height * CGFloat(5.1)/11
    app.goal2s.append(goal)
    
    // 背景音樂
    playSound(name: "stage5", numberOfLoops: -1)
}
func stage1_5(view:UIView) {
    // 背景
    UIGraphicsBeginImageContext(view.frame.size)
    UIImage(named: "background1_5")?.draw(in: view.bounds)
    
    let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    
    UIGraphicsEndImageContext()
    
    view.backgroundColor = UIColor(patternImage: image)
    
    // Monkey
    app.ball = nil
    app.ball = Ball(image: UIImage(named: "monkey ball")!)
    app.ball.frame.size = CGSize(width: view.frame.width*42/375, height: view.frame.width*42/375)
    app.ball.frame.origin.x = view.frame.width * 0/6
    app.ball.frame.origin.y = view.frame.height * 9.3/11
    
    app.ball.start = app.ball.center

    // Wall
    for i in 3...10 {
        if i == 9 {
            continue
        }
        let wall = UIImageView(image: UIImage(named: "wall"))
        wall.frame.size = CGSize(width: view.frame.width*64/375, height: view.frame.width*64/375)
        wall.frame.origin.x = 0
        wall.frame.origin.y = view.frame.height * CGFloat(i)/11
        app.wall2s.append(wall)
    }
    for i in 5...10 {
        if i == 9 {
            continue
        }
        let wall = UIImageView(image: UIImage(named: "wall"))
        wall.frame.size = CGSize(width: view.frame.width*64/375, height: view.frame.width*64/375)
        wall.frame.origin.x = view.frame.width  * CGFloat(1)/6
        wall.frame.origin.y = view.frame.height * CGFloat(i)/11
        app.wall2s.append(wall)
    }
    for i in [0, 1, 7, 10] {
        let wall = UIImageView(image: UIImage(named: "wall"))
        wall.frame.size = CGSize(width: view.frame.width*64/375, height: view.frame.width*64/375)
        wall.frame.origin.x = view.frame.width  * CGFloat(2)/6
        wall.frame.origin.y = view.frame.height * CGFloat(i)/11
        app.wall2s.append(wall)
    }
    for i in [0, 1, 3, 4] {
        let wall = UIImageView(image: UIImage(named: "wall"))
        wall.frame.size = CGSize(width: view.frame.width*64/375, height: view.frame.width*64/375)
        wall.frame.origin.x = view.frame.width  * CGFloat(3)/6
        wall.frame.origin.y = view.frame.height * CGFloat(i)/11
        app.wall2s.append(wall)
    }
    for i in [6, 10] {
        let wall = UIImageView(image: UIImage(named: "wall"))
        wall.frame.size = CGSize(width: view.frame.width*64/375, height: view.frame.width*64/375)
        wall.frame.origin.x = view.frame.width  * CGFloat(4)/6
        wall.frame.origin.y = view.frame.height * CGFloat(i)/11
        app.wall2s.append(wall)
    }
    for i in [2, 3, 4, 5, 8, 10] {
        let wall = UIImageView(image: UIImage(named: "wall"))
        wall.frame.size = CGSize(width: view.frame.width*64/375, height: view.frame.width*64/375)
        wall.frame.origin.x = view.frame.width  * CGFloat(5)/6
        wall.frame.origin.y = view.frame.height * CGFloat(i)/11
        app.wall2s.append(wall)
    }
    
    // 桃子
    var peach = UIImageView(image: UIImage(named: "peach"))
    peach.frame.size = CGSize(width: view.frame.width*56/375, height: view.frame.width*56/375)
    peach.frame.origin.x = view.frame.width  * CGFloat(5)/6
    peach.frame.origin.y = view.frame.height * CGFloat(9)/11
    app.peachs.append(peach)
    
    peach = UIImageView(image: UIImage(named: "peach"))
    peach.frame.size = CGSize(width: view.frame.width*56/375, height: view.frame.width*56/375)
    peach.frame.origin.x = view.frame.width  * CGFloat(4)/6
    peach.frame.origin.y = view.frame.height * CGFloat(7)/11
    app.peachs.append(peach)
    
    peach = UIImageView(image: UIImage(named: "peach"))
    peach.frame.size = CGSize(width: view.frame.width*56/375, height: view.frame.width*56/375)
    peach.frame.origin.x = view.frame.width  * CGFloat(0)/6
    peach.frame.origin.y = view.frame.height * CGFloat(1)/11
    app.peachs.append(peach)
    
    // 洞
    let holeside = view.frame.width*48/375
    app.holes.append(CGRect(x: view.frame.width*1.1/6, y: view.frame.height*4.1/11, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*3.1/6, y: view.frame.height*10.1/11, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*4.1/6, y: view.frame.height*3.1/11, width: holeside, height: holeside))
    
    // 妖怪
    var monstrer = UIImageView(image: UIImage(named: "monster_3"))
    monstrer.frame.size = CGSize(width: view.frame.width*48/375, height: view.frame.width*48/375)
    monstrer.frame.origin.x = view.frame.width * CGFloat(3.1)/6
    monstrer.frame.origin.y = view.frame.height * CGFloat(9.1)/11
    monstrer.tag = 1
    app.monsters.append(monstrer)
    
    monstrer = UIImageView(image: UIImage(named: "monster_1"))
    monstrer.frame.size = CGSize(width: view.frame.width*48/375, height: view.frame.width*48/375)
    monstrer.frame.origin.x = view.frame.width * CGFloat(2.1)/6
    monstrer.frame.origin.y = view.frame.height * CGFloat(2.1)/11
    monstrer.tag = 2
    app.monsters.append(monstrer)
    
    
    // 目標
    let goal = UIImageView(image: UIImage(named: "Prison"))
    goal.frame.size = CGSize.zero
    //goal.frame.size = CGSize(width: view.frame.width*64/375, height: view.frame.width*64/375)
    goal.frame.origin.x = view.frame.width  * CGFloat(4.8)/6
    goal.frame.origin.y = view.frame.height * CGFloat(0.5)/11
    app.goal2s.append(goal)
}




