//
//  ViewController.swift
//  FigureMove
//
//  Created by huan huan on 3/27/17.
//  Copyright © 2017 huan huan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myView: UIView!
    var timerMoveLeftToRight: Timer!
    var timerMove: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView = UIView(frame: CGRect(x: 25.0, y: 25.0, width: 50.0, height: 50.0))
        myView.backgroundColor = UIColor.blue
        view.addSubview(myView)
        
        moveLeftToRight()
        
    }
    
    func moveLeftToRight() {
        timerMoveLeftToRight = Timer.scheduledTimer(timeInterval: 0.0002, target: self, selector: #selector(move), userInfo: nil, repeats: true)
    }
    
    func move() {
        myView.center = CGPoint(x: myView.center.x + 1, y: myView.center.y)
        if myView.center.x >= view.bounds.width - myView.bounds.width {
            timerMoveLeftToRight.invalidate()
            timerMove = Timer.scheduledTimer(timeInterval: 0.0002, target: self, selector: #selector(checkMove), userInfo: nil, repeats: true)
        }
        
    }
    
    func checkMove() {
        var xxx = CGFloat(1)
        var yyy = CGFloat(1)
        if myView.center.x >= view.bounds.width - myView.bounds.width {
            xxx = 0
            yyy = CGFloat(1)
        }
        if myView.center.y >= view.bounds.height - myView.bounds.height {
            xxx = -CGFloat(1)
            yyy = 0
        }
        if myView.center.x <= myView.bounds.width {
            xxx = 0
            yyy = -CGFloat(1)
        }
        if myView.center.y <= myView.bounds.height {
            timerMove.invalidate()
            moveLeftToRight()
        }
        myView.center = CGPoint(x: myView.center.x + xxx, y: myView.center.y + yyy)
    }

}

