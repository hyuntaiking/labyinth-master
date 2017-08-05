//
//  stageSet.swift
//  Labyinth
//
//  Created by 陳信毅 on 2017/7/21.
//  Copyright © 2017年 hyphen. All rights reserved.
//

import Foundation
import UIKit

private let app = UIApplication.shared.delegate as! AppDelegate


func switchStage(view:UIView) {
    // 清除元素陣列
    let refreshSecond = 0.1
    clearStageElement()
    
    // 建構關卡元素陣列
    switch app.stageName{
    case "stage1_1": stage1_1(view: view)
    case "stage1_2": stage1_2(view: view)
    case "stage1_3": stage1_3(view: view)
    case "stage1_4": stage1_4(view: view)
    case "stage1_5": stage1_5(view: view)
    default:
        chapter1(view: view)
    }
    
    // 記錄app.ball的起始點
    app.ball.start = app.ball.frame.origin
    
    
    // 畫面元素
    showStageElement(view: view)
    
    // 開始循環偵測
    app.refreshTimer = refreshTime(timeInterval: refreshSecond)

    // 加入球
    app.gravity!.addItem(app.ball)
    app.collision!.addItem(app.ball)
}
// 切換關卡
func clearStageElement() {
    app.walls    = []
    app.wall2s   = []
    app.holes    = []
    app.monsters = []
    app.peachs   = []
    app.goals    = []
    app.goal2s   = []
    app.stages   = []
    
}

func showStageElement(view:UIView) {
    // 畫球
    view.addSubview(app.ball)
    // 畫牆
    for i in 0..<app.walls.count {
        let wall = UIView(frame: app.walls[i])
        wall.backgroundColor = UIColor.blue
        view.addSubview(wall)
        app.collision!.addBoundary(withIdentifier: "wall\(i)" as NSCopying,
                                   for: UIBezierPath(rect: wall.frame))
    }
    // 畫牆
    for i in 0..<app.wall2s.count {
        view.addSubview(app.wall2s[i])
        app.collision!.addBoundary(withIdentifier: "wall2\(i)" as NSCopying,
                                   for: UIBezierPath(rect: app.wall2s[i].frame))
        app.collisionForMonster?.addBoundary(withIdentifier: "wall2\(i)" as NSCopying,
                                            for: UIBezierPath(rect: app.wall2s[i].frame))
    }
    // 畫洞
    for i in 0..<app.holes.count {
        let hole = HoleView(frame: app.holes[i])
        view.addSubview(hole)
        app.collisionForMonster?.addBoundary(withIdentifier: "hole\(i)" as NSCopying,
                                             for: UIBezierPath(rect: hole.frame))
    }
    // 畫妖怪
    for i in 0..<app.monsters.count {
        view.addSubview(app.monsters[i])
        app.collisionForMonster?.addItem(app.monsters[i])
    }
    // 畫桃子
    for i in 0..<app.peachs.count {
        view.addSubview(app.peachs[i])
        //app.collision!.addItem(app.peachs[i])
    }
    // 畫目標
    for i in 0..<app.goals.count {
        let goal = GoalView(frame: app.goals[i])
        view.addSubview(goal)
    }
    // 畫目標
    for i in 0..<app.goal2s.count {
        view.addSubview(app.goal2s[i])
    }
    // 畫關卡
    for i in 0..<app.stages.count {
        let stage = UIImageView(frame: app.stages[i].frame)
        stage.image = app.stages[i].image
        view.addSubview(stage)
    }
    
}


func refreshTime(timeInterval:Double) -> Timer {
    return Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true, block: {
        (timer) in
        //加上引力
        app.gravity!.gravityDirection = CGVector(dx: 2 * app.accelerometerX, dy: 2 * app.accelerometerY)
        
    })
}


