//
//  ViewController.swift
//  CALayer
//
//  Created by 关蕤 on 2019/3/10.
//  Copyright © 2019 GR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let slider = UISlider()
    let progressLayers = Array(repeating: ProgressLayer(), count: 4)
    
    let top = 110
    let vSpace = 30
    let size = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        view.addSubview(slider)
        
        progressLayers.forEach { progressLayer in
            view.layer.addSublayer(progressLayer)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let width = Int(view.frame.width)
        slider.frame = CGRect(x: 50, y: 70, width: width - 100, height: 30)
        
        let hSpace = (width - size * 2) / 3
        for (index, progressLayer) in progressLayers.enumerated() {
            progressLayer.frame = CGRect(x: hSpace + (size + hSpace) * (index % 2), y: <#T##Int#>, width: size, height: size)
        }
    }
    
    @objc func valueChanged() {
        
    }
}

class ProgressLayer: CALayer {
    let textLayer = CATextLayer()
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
