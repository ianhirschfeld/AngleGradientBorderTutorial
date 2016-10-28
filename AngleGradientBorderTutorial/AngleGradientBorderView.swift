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
    UIColor.red.cgColor,
    UIColor.green.cgColor,
    UIColor.blue.cgColor,
    UIColor.red.cgColor, // Repeat the first color to make a smooth transition
  ]
  let DefaultGradientBorderWidth: CGFloat = 4

  // Set the UIView's layer class to be our AngleGradientBorderLayer
  override class var layerClass : AnyClass {
    return AngleGradientBorderLayer.self
  }

  // Initializer
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupGradientLayer()
  }

  // Custom initializer
  init(frame: CGRect, borderColors gradientBorderColors: [AnyObject]? = nil, borderWidth gradientBorderWidth: CGFloat? = nil) {
    super.init(frame: frame)
    setupGradientLayer(borderColors: gradientBorderColors, borderWidth: gradientBorderWidth)
  }

  // Setup the attributes of this view's layer
  func setupGradientLayer(borderColors gradientBorderColors: [AnyObject]? = nil, borderWidth gradientBorderWidth: CGFloat? = nil) {
    // Grab this UIView's layer and cast it as AngleGradientBorderLayer
    let l: AngleGradientBorderLayer = self.layer as! AngleGradientBorderLayer

    // NOTE: Since our gradient layer is built as an image,
    // we need to scale it to match the display of the device.
    l.contentsScale = UIScreen.main.scale

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
