//
//  AngleGradientBorderLayer.swift
//  AngleGradientBorderTutorial
//
//  Created by Ian Hirschfeld on 9/29/14.
//  Copyright (c) 2014 Ian Hirschfeld. All rights reserved.
//

import UIKit

class AngleGradientBorderLayer: AngleGradientLayer {

  // Properties
  var gradientBorderWidth: CGFloat = 1

  // Override to add border shape to AngleGradientLayer
  override func drawInContext(ctx: CGContext!) {
    let circlePath = UIBezierPath(roundedRect: CGRectInset(bounds, gradientBorderWidth, gradientBorderWidth), cornerRadius: bounds.height / 2)
    let newPath = CGPathCreateCopyByStrokingPath(circlePath.CGPath, nil, gradientBorderWidth, kCGLineCapButt, kCGLineJoinBevel, 0)

    CGContextSaveGState(ctx)
    CGContextAddPath(ctx, newPath)
    CGContextClip(ctx)
    super.drawInContext(ctx)
    CGContextRestoreGState(ctx)
  }
}
