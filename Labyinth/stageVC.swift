//
//  stageVC.swift
//  Labyinth
//
//  Created by 陳信毅 on 2017/7/20.
//  Copyright © 2017年 hyphen. All rights reserved.
//

import UIKit
import CoreMotion

class stageVC: UIViewController {

    let app = UIApplication.shared.delegate as! AppDelegate
    var animator: UIDynamicAnimator?
    let mm = CMMotionManager()

    // 隱藏最上方的狀態列
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 將螢幕關閉功能取消
        UIApplication.shared.isIdleTimerDisabled = true
        
        // 啟動加速器取得加速值
        mm.startAccelerometerUpdates(to: OperationQueue(), withHandler: { (data,error)  in
            if let tmp = data?.acceleration {
                self.app.accelerometerX =   tmp.x
                self.app.accelerometerY =  -tmp.y
            }
        })
        
        //動態行為建構
        animator = UIDynamicAnimator(referenceView: view)
        // 引力
        app.gravity = UIGravityBehavior()
        animator?.addBehavior(app.gravity!)
        // 碰撞
        app.collision = UICollisionBehavior()
        app.collision!.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(app.collision!)
        app.collisionForMonster = UICollisionBehavior()
        app.collisionForMonster!.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(app.collisionForMonster!)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        switchStage(view: view)
        app.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: {(timer) in
            self.goal(view: self.view)
            self.holl(view: self.view)
            self.monster(view: self.view)
            self.peach(view: self.view)
        })
        // 阻尼
        for i in 0..<app.monsters.count {
            // tag為0不動
            if app.monsters[i].tag == 0 {
                continue
            }
            // 修改磨擦力、阻力
            let itemBehavior = UIDynamicItemBehavior(items: [app.monsters[i]])
            itemBehavior.elasticity = 1 // 反彈係數
            itemBehavior.friction = 0   // 磨擦力
            itemBehavior.resistance = 0 // 阻力
            animator?.addBehavior(itemBehavior)
            // 推力
            app.push = UIPushBehavior(items: [app.monsters[i]], mode: .instantaneous)
            // 
            if app.monsters[i].tag == 1 {
                app.push?.pushDirection = CGVector(dx: 0, dy: 0.4)
            }
            if app.monsters[i].tag == 2 {
                app.push?.pushDirection = CGVector(dx: 0.4, dy: 0)
            }
            
            animator?.addBehavior(app.push!)
        }
    }
    
    //掉進洞的判斷
    func holl(view: UIView) {
        for hole in app.holes {
            if app.ball.center.x >= hole.origin.x &&
                app.ball.center.x <= hole.origin.x + hole.size.width &&
                app.ball.center.y >= hole.origin.y &&
                app.ball.center.y <= hole.origin.y + hole.size.height {
                // 背景音樂
                playSound(name: "die", numberOfLoops: 0)
                app.gravity!.removeItem(app.ball)
                app.collision!.removeItem(app.ball)
                app.refreshTimer?.invalidate()
                app.refreshTimer = nil
                app.timer?.invalidate()
                app.timer = nil

                
                let imageView = UIImageView(frame: (app.ball.frame))
                app.ball.removeFromSuperview()
                
                imageView.image = app.ball.image
                view.addSubview(imageView)
                
                UIView.animate(withDuration: 1, animations: {
                    imageView.frame.origin.x = hole.origin.x
                    imageView.frame.origin.y = hole.origin.y
                    imageView.alpha = 0
                    imageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                })
                app.ball.center = app.ball.start
                //Sleep 1 Sec
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: {(timer) in
                    view.addSubview(self.app.ball)
                    self.app.gravity!.addItem(self.app.ball)
                    self.app.collision!.addItem(self.app.ball)
                    self.app.refreshTimer = refreshTime(timeInterval: 0.1)
                    self.app.timer = self.appTimer(timeInterval: 0.1)
                })
            }
        }
    }
    //接觸妖怪的判斷
    func monster(view: UIView) {
        for monster in app.monsters {
            if app.ball.frame.origin.x + app.ball.frame.size.width >= monster.frame.origin.x &&
               app.ball.frame.origin.x <= monster.frame.origin.x + monster.frame.size.width &&
               app.ball.frame.origin.y + app.ball.frame.size.height >= monster.frame.origin.y &&
               app.ball.frame.origin.y <= monster.frame.origin.y + monster.frame.size.height {
                // 背景音樂
                playSound(name: "die", numberOfLoops: 0)
                app.gravity!.removeItem(app.ball)
                app.collision!.removeItem(app.ball)
                app.refreshTimer?.invalidate()
                app.refreshTimer = nil
                app.timer?.invalidate()
                app.timer = nil
                
                
                let imageView = UIImageView(frame: (app.ball.frame))
                app.ball.removeFromSuperview()
                
                imageView.image = app.ball.image
                view.addSubview(imageView)
                
                UIView.animate(withDuration: 1, animations: {
                    imageView.frame.origin.x = monster.frame.origin.x
                    imageView.frame.origin.y = monster.frame.origin.y
                    imageView.alpha = 0
                    imageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                })
                app.ball.center = app.ball.start
                //Sleep 1 Sec
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: {(timer) in
                    view.addSubview(self.app.ball)
                    self.app.gravity!.addItem(self.app.ball)
                    self.app.collision!.addItem(self.app.ball)
                    self.app.refreshTimer = refreshTime(timeInterval: 0.1)
                    self.app.timer = self.appTimer(timeInterval: 0.1)
                })
            }
        }
    }
    //接觸桃子的判斷
    func peach(view: UIView) {
        for (index,peach) in app.peachs.enumerated() {
            if app.ball.frame.origin.x + app.ball.frame.size.width >= peach.frame.origin.x &&
                app.ball.frame.origin.x <= peach.frame.origin.x + peach.frame.size.width &&
                app.ball.frame.origin.y + app.ball.frame.size.height >= peach.frame.origin.y &&
                app.ball.frame.origin.y <= peach.frame.origin.y + peach.frame.size.height {
                peach.removeFromSuperview()
                app.peachs.remove(at: index)
                print(app.peachs.count)
                if app.peachs.count == 0 {
                    app.goal2s[0].frame.size = CGSize(width: view.frame.width*48/375, height: view.frame.width*48/375)
                    // 背景音樂
                    playSound(name: "find", numberOfLoops: 0)
                }
            }
        }
    }

    //掉進目標的判斷
    func goal(view:UIView) {
        for goal in app.goals {
            if app.ball.center.x >= goal.origin.x &&
                app.ball.center.x <= goal.origin.x + goal.size.width &&
                app.ball.center.y >= goal.origin.y &&
                app.ball.center.y <= goal.origin.y + goal.size.height {
                app.gravity!.removeItem(app.ball)
                app.collision!.removeItem(app.ball)
                
                let imageView = UIImageView(frame: (app.ball.frame))
                app.ball.removeFromSuperview()
                
                imageView.image = app.ball.image
                view.addSubview(imageView)
                
                UIView.animate(withDuration: 1, animations: {
                    imageView.frame.origin.x = goal.origin.x
                    imageView.frame.origin.y = goal.origin.y
                    imageView.alpha = 0
                })
                
                app.stageName = ""
                app.gravity = nil
                app.collision = nil

                app.timer?.invalidate()
                app.refreshTimer?.invalidate()
                app.timer = nil
                mm.stopAccelerometerUpdates()

                if let vc = storyboard?.instantiateViewController(withIdentifier: "MainVC"){
                    show(vc, sender: self)
                }
                
            }
        }
        for goal in app.goal2s {
            if app.ball.center.x >= goal.frame.origin.x &&
                app.ball.center.x <= goal.frame.origin.x + goal.frame.size.width &&
                app.ball.center.y >= goal.frame.origin.y &&
                app.ball.center.y <= goal.frame.origin.y + goal.frame.size.height {
                app.gravity!.removeItem(app.ball)
                app.collision!.removeItem(app.ball)
                
                let imageView = UIImageView(frame: (app.ball.frame))
                app.ball.removeFromSuperview()
                
                imageView.image = app.ball.image
                view.addSubview(imageView)
                
                UIView.animate(withDuration: 1, animations: {
                    imageView.frame.origin.x = goal.frame.origin.x
                    imageView.frame.origin.y = goal.frame.origin.y
                    imageView.alpha = 0
                })
                
                app.stageName = ""
                app.gravity = nil
                app.collision = nil
                
                app.timer?.invalidate()
                app.refreshTimer?.invalidate()
                app.timer = nil
                mm.stopAccelerometerUpdates()
                
                if let vc = storyboard?.instantiateViewController(withIdentifier: "MainVC"){
                    show(vc, sender: self)
                }
                
            }
        }
    }
    
    func appTimer(timeInterval:Double)->Timer{
        return Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: {(timer) in
            self.goal(view: self.view)
            self.holl(view: self.view)
            self.monster(view: self.view)
            self.peach(view: self.view)

        })
    }

}
