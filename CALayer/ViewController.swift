//
//  ViewController.swift
//  CALayer
//
//  Created by 关蕤 on 2019/3/10.
//  Copyright © 2019 GR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let slider = UISlider()
    private let progressLayers = [
        ProgressLayer1(),
        ProgressLayer(),
        ProgressLayer(),
        ProgressLayer()
    ]
    
    private let top = 110
    private let size = 100
    private let hCount = 2
    private let vSpace = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.value = 0.89
        slider.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        view.addSubview(slider)
        
        progressLayers.forEach { progressLayer in
            progressLayer.contentsScale = UIScreen.main.scale
            progressLayer.number = slider.value
            view.layer.addSublayer(progressLayer)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let width = Int(view.frame.width)
        slider.frame = CGRect(x: 50, y: 70, width: width - 100, height: 30)
        
        let hSpace = (width - size * hCount) / 3
        for (index, progressLayer) in progressLayers.enumerated() {
            progressLayer.frame = CGRect(x: hSpace + (size + hSpace) * (index % 2), y: top + (size + vSpace) * (index / hCount), width: size, height: size)
        }
    }
    
    @objc func valueChanged() {
        progressLayers.forEach { progressLayer in
            progressLayer.number = slider.value
        }
    }
}

class ProgressLayer: CALayer {
    private let textLayer = CATextLayer()
    
    var number: Float = 0.0 {
        didSet {
            textLayer.string = String(format: "%.0lf%%", number * 100)
            textLayer.setNeedsDisplay()
            setNeedsDisplay()
        }
    }
    
    override init() {
        super.init()
        textLayer.contentsScale = UIScreen.main.scale
        textLayer.fontSize = 14
        textLayer.foregroundColor = UIColor.black.cgColor
        textLayer.alignmentMode = CATextLayerAlignmentMode.center
        textLayer.isWrapped = true
        addSublayer(textLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSublayers() {
        super.layoutSublayers()
        let textHeight = NSString(string: "100%").boundingRect(with: CGSize(width: CGFloat.infinity, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)], context: nil).height
        textLayer.frame = CGRect(x: 0, y: frame.height / 2 - textHeight / 2, width: frame.width, height: textHeight)
    }
}

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
