//
//  ProgressLayer4.swift
//  CALayer
//
//  Created by 关蕤 on 2019/3/11.
//  Copyright © 2019 GR. All rights reserved.
//

import UIKit

class ProgressLayer4: ProgressLayer {
    
    override func draw(in ctx: CGContext) {
        let radius = frame.width * 0.45
        let center = CGPoint(x: frame.width / 2, y: frame.height / 2)
        let endAngle = 2 * CGFloat.pi * CGFloat(number) - CGFloat.pi / 2
        
        ctx.setStrokeColor(UIColor.gray.withAlphaComponent(0.4).cgColor)
        ctx.setLineWidth(frame.width * 0.036)
        ctx.addEllipse(in: CGRect(x: frame.width / 2 - radius, y: frame.height / 2 - radius, width: radius * 2, height: radius * 2))
        ctx.strokePath()
        
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.setLineWidth(frame.width * 0.05)
        ctx.setLineCap(CGLineCap.round)
        ctx.addArc(center: center, radius: radius, startAngle: -CGFloat.pi / 2, endAngle: endAngle, clockwise: false)
        ctx.strokePath()
    }
}
