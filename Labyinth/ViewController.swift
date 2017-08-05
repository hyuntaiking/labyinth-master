//
//  ViewController.swift
//  Labyinth
//
//  Created by Hyuntai on 2017/7/17.
//  Copyright © 2017年 hyphen. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    let app = UIApplication.shared.delegate as! AppDelegate
    var animator: UIDynamicAnimator!
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
        animator.addBehavior(app.gravity!)
        // 碰撞
        app.collision = UICollisionBehavior()
        app.collision!.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(app.collision!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        switchStage(view: view)
        app.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: {(timer) in
            self.stage(view: self.view)
            
        })
    }

    //掉進關卡的判斷
    func stage(view:UIView) {
        for stage in app.stages {
            if app.ball.center.x >= stage.frame.origin.x &&
                app.ball.center.x <= stage.frame.origin.x + stage.frame.width &&
                app.ball.center.y >= stage.frame.origin.y &&
                app.ball.center.y <= stage.frame.origin.y + stage.frame.height {
                // 音樂
                playSound(name: "stage", numberOfLoops: 0)
                
                app.gravity!.removeItem(app.ball)
                app.collision!.removeItem(app.ball)
                
                let imageView = UIImageView(frame: (app.ball.frame))
                app.ball.removeFromSuperview()
                
                imageView.image = app.ball.image
                view.addSubview(imageView)
                
                UIView.animate(withDuration: 1, animations: {
                    imageView.frame.origin.x = stage.frame.origin.x
                    imageView.frame.origin.y = stage.frame.origin.y
                    imageView.alpha = 0
                })
                // 切換關卡
                app.stageName = stage.name
                app.gravity = nil
                app.collision = nil
                app.timer?.invalidate()
                app.timer = nil
                app.refreshTimer?.invalidate()
                app.refreshTimer = nil
                mm.stopAccelerometerUpdates()
                
                if let vc = storyboard?.instantiateViewController(withIdentifier: "stageVC"){
                    show(vc, sender: self)
                }
            }
        }
    }

}

