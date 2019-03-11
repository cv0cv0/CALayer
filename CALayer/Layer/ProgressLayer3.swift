//
//  ProgressLayer3.swift
//  CALayer
//
//  Created by 关蕤 on 2019/3/11.
//  Copyright © 2019 GR. All rights reserved.
//

import UIKit

class ProgressLayer3: ProgressLayer {
    
    override func draw(in ctx: CGContext) {
        let radius = frame.width * 0.45
        let center = CGPoint(x: frame.width / 2, y: frame.height / 2)
        let startAngle = CGFloat.pi / 2 - CGFloat(number) * CGFloat.pi
        let endAngle = CGFloat.pi / 2 + CGFloat(number) * CGFloat.pi
        
        ctx.setStrokeColor(UIColor.gray.withAlphaComponent(0.4).cgColor)
        ctx.setLineWidth(frame.width * 0.036)
        ctx.addEllipse(in: CGRect(x: frame.width / 2 - radius, y: frame.height / 2 - radius, width: radius * 2, height: radius * 2))
        ctx.strokePath()
        
        ctx.setFillColor(UIColor.cyan.cgColor)
        ctx.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        ctx.closePath()
        ctx.fillPath()
    }
}

