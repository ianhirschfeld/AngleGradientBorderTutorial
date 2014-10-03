//
//  ViewController.swift
//  AngleGradientBorderTutorial
//
//  Created by Ian Hirschfeld on 9/28/14.
//  Copyright (c) 2014 Ian Hirschfeld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // UI
  @IBOutlet var angleGradientBorderView1: AngleGradientBorderView!
  @IBOutlet var angleGradientBorderView2: AngleGradientBorderView!
  @IBOutlet var angleGradientBorderView3: AngleGradientBorderView!

  override func viewDidLoad() {
    super.viewDidLoad()

    let angleGradientBorderView1Colors: [AnyObject] = [
      UIColor.purpleColor().CGColor,
      UIColor.yellowColor().CGColor,
      UIColor.orangeColor().CGColor,
      UIColor.purpleColor().CGColor,
    ]
    // Change the colors of angleGradientBorderView1 and its border width
    angleGradientBorderView1.setupGradientLayer(borderColors: angleGradientBorderView1Colors, borderWidth: 5)

    let angleGradientBorderView3Colors: [AnyObject] = [
      UIColor.redColor().CGColor,
      UIColor.orangeColor().CGColor,
      UIColor.yellowColor().CGColor,
      UIColor.greenColor().CGColor,
      UIColor.blueColor().CGColor,
      UIColor.purpleColor().CGColor,
      UIColor.magentaColor().CGColor,
      UIColor.redColor().CGColor,
    ]
    // Change the colors of angleGradientBorderView1 and its border width
    angleGradientBorderView3.setupGradientLayer(borderColors: angleGradientBorderView3Colors, borderWidth: 10)

    // Add some animation
    scaleDownView()
    rotateView()
  }

  func scaleDownView() {
    let animation = CABasicAnimation(keyPath: "transform.scale")
    animation.fromValue = 1
    animation.toValue = 0.5
    animation.duration = 2
    animation.removedOnCompletion = true
    animation.delegate = self
    animation.setValue("shrink", forKey: "animationId")
    angleGradientBorderView1.layer.addAnimation(animation, forKey: "shrink")
  }

  func scaleUpView() {
    let animation = CABasicAnimation(keyPath: "transform.scale")
    animation.fromValue = 0.5
    animation.toValue = 1
    animation.duration = 2
    animation.removedOnCompletion = true
    animation.delegate = self
    animation.setValue("grow", forKey: "animationId")
    angleGradientBorderView1.layer.addAnimation(animation, forKey: "grow")
  }

  func rotateView() {
    let animation = CABasicAnimation(keyPath: "transform.rotation")
    animation.fromValue = 0
    animation.toValue = 2 * M_PI
    animation.duration = 3
    animation.removedOnCompletion = true
    animation.delegate = self
    animation.setValue("spin", forKey: "animationId")
    angleGradientBorderView3.layer.addAnimation(animation, forKey: "spin")
  }

  override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
    if flag {
      if let id: String = anim.valueForKey("animationId") as? String {
        switch id {
        case "shrink":
          scaleUpView()

        case "grow":
          scaleDownView()

        case "spin":
          rotateView()

        default:
          break
        }
      }
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

