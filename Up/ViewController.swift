//
//  ViewController.swift
//  Up
//
//  Created by piet groot kormelink on 2014-11-12.
//  Copyright (c) 2014 Loc4or. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var upView : UpView = view as UpView
        upView.startAllAnimations(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func panGesture(sender: UIPanGestureRecognizer) {
        var upView : UpView = view as UpView
        var p = sender.translationInView(view)
        upView.progress = controlledProgress(abs(p.x) / upView.frame.width)
        //println("\(p.x) / \(upView.frame.width) \(upView.progress)")
    }

    func controlledProgress(progress: CGFloat) -> CGFloat {
        var result = round(progress*100)/50 // per 0.1 ..  2%
        if result >= 1 { result = 0.999 }
        return result
    }
}

