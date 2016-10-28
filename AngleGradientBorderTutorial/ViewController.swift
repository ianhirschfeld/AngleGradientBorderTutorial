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
      UIColor.purple.cgColor,
      UIColor.yellow.cgColor,
      UIColor.orange.cgColor,
      UIColor.purple.cgColor,
    ]
    // Change the colors of angleGradientBorderView1 and its border width
    angleGradientBorderView1.setupGradientLayer(borderColors: angleGradientBorderView1Colors, borderWidth: 5)

    let angleGradientBorderView3Colors: [AnyObject] = [
      UIColor.red.cgColor,
      UIColor.orange.cgColor,
      UIColor.yellow.cgColor,
      UIColor.green.cgColor,
      UIColor.blue.cgColor,
      UIColor.purple.cgColor,
      UIColor.magenta.cgColor,
      UIColor.red.cgColor,
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
    animation.isRemovedOnCompletion = true
    animation.delegate = self
    animation.setValue("shrink", forKey: "animationId")
    angleGradientBorderView1.layer.add(animation, forKey: "shrink")
    angleGradientBorderView1.layer.transform = CATransform3DScale(CATransform3DIdentity, 0.5, 0.5, 1)
  }

  func scaleUpView() {
    let animation = CABasicAnimation(keyPath: "transform.scale")
    animation.fromValue = 0.5
    animation.toValue = 1
    animation.duration = 2
    animation.isRemovedOnCompletion = true
    animation.delegate = self
    animation.setValue("grow", forKey: "animationId")
    angleGradientBorderView1.layer.add(animation, forKey: "grow")
    angleGradientBorderView1.layer.transform = CATransform3DIdentity
  }

  func rotateView() {
    let animation = CABasicAnimation(keyPath: "transform.rotation")
    animation.fromValue = 0
    animation.toValue = 2 * M_PI
    animation.duration = 3
    animation.isRemovedOnCompletion = true
    animation.delegate = self
    animation.setValue("spin", forKey: "animationId")
    angleGradientBorderView3.layer.add(animation, forKey: "spin")
  }

}

extension ViewController: CAAnimationDelegate {

  func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    if flag {
      if let id: String = anim.value(forKey: "animationId") as? String {
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

}
