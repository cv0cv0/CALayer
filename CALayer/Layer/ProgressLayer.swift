//
//  ProgressLayer.swift
//  CALayer
//
//  Created by 关蕤 on 2019/3/11.
//  Copyright © 2019 GR. All rights reserved.
//

import UIKit

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
        let textBound = NSString(string: "100%").boundingRect(with: CGSize(width: CGFloat.infinity, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)], context: nil)
        
        textLayer.frame = CGRect(x: frame.width / 2 - textBound.width / 2, y: frame.height / 2 - textBound.height / 2, width: textBound.width, height: textBound.height)
    }
}
