//
//  ProgressLayer1.swift
//  CALayer
//
//  Created by 关蕤 on 2019/3/11.
//  Copyright © 2019 GR. All rights reserved.
//

import UIKit

class ProgressLayer1: ProgressLayer {
    
    override func draw(in ctx: CGContext) {
        let radius = frame.width * 0.45
        let center = CGPoint(x: frame.width / 2, y: frame.height / 2)
        let endAngle = 2 * CGFloat.pi * CGFloat(number) - CGFloat.pi / 2
        
        ctx.setStrokeColor(UIColor.purple.cgColor)
        ctx.setLineWidth(frame.width * 0.05)
        ctx.setLineCap(CGLineCap.round)
        
        ctx.addArc(center: center, radius: radius, startAngle: -CGFloat.pi / 2, endAngle: endAngle, clockwise: false)
        ctx.strokePath()
    }
}
