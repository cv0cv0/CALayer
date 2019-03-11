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
        ProgressLayer2(),
        ProgressLayer3(),
        ProgressLayer4()
    ]
    
    private let top = 140
    private let size = 100
    private let hCount = 2
    private let vSpace = 40
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.value = 0.85
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
