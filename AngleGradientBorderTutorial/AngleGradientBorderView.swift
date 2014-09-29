//
//  AngleGradientBorderView.swift
//  AngleGradientBorderTutorial
//
//  Created by Ian Hirschfeld on 9/29/14.
//  Copyright (c) 2014 Ian Hirschfeld. All rights reserved.
//

import UIKit

class AngleGradientBorderView: UIView {

  // Constants
  let DefaultGradientBorderColors: [AnyObject] = [
    UIColor.redColor().CGColor,
    UIColor.greenColor().CGColor,
    UIColor.blueColor().CGColor,
    UIColor.redColor().CGColor, // Repeat the first color to make a smooth transition
  ]
  let DefaultGradientBorderWidth: CGFloat = 4

  // Set the UIView's layer class to be our AngleGradientBorderLayer
  override class func layerClass() -> AnyClass {
    return AngleGradientBorderLayer.self
  }

  // Initializer
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupGradientLayer()
  }

  // Custom initializer
  init(frame: CGRect, borderColors gradientBorderColors: [AnyObject]? = nil, borderWidth gradientBorderWidth: CGFloat? = nil) {
    super.init(frame: frame)
    setupGradientLayer(borderColors: gradientBorderColors, borderWidth: gradientBorderWidth)
  }

  func setupGradientLayer(borderColors gradientBorderColors: [AnyObject]? = nil, borderWidth gradientBorderWidth: CGFloat? = nil) {
    // Grad this UIView's layer and cast it as AngleGradientBorderLayer
    let l: AngleGradientBorderLayer = self.layer as AngleGradientBorderLayer

    // Since our gradient layer is built as an image, we need to scale it to match the displayer of the device.
    l.contentsScale = UIScreen.mainScreen().scale

    // Set the gradient colors
    if gradientBorderColors != nil {
      l.colors = gradientBorderColors!
    } else {
      l.colors = DefaultGradientBorderColors
    }

    // Set the border width of the gradient
    if gradientBorderWidth != nil {
      l.gradientBorderWidth = gradientBorderWidth!
    } else {
      l.gradientBorderWidth = DefaultGradientBorderWidth
    }
  }
  
}
