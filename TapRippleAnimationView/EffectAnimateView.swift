//
//  WaveView.swift
//  tapEffect
//
//  Created by Willy Chen on 2020/3/18.
//  Copyright © 2020 Willy Chen. All rights reserved.
//

import UIKit

internal class EffectAnimateView: UIView {
    var waveSize: CGSize = CGSize(width: 400, height: 400)
    var duration = 0.5
    var opacityFromValue = 0.3
    var opacityToValue = 0.0

    internal init(center: CGPoint) {
        super.init(frame: CGRect.zero)
        let x = center.x - waveSize.width * 0.5
        let y = center.y - waveSize.height * 0.5
        let width = waveSize.width
        let height = waveSize.height
        
        let frame = CGRect(x: x, y: y, width: width, height: height)
        self.frame = frame
    }
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        let waveLayer = CAShapeLayer()
        waveLayer.backgroundColor = UIColor.clear.cgColor
        waveLayer.fillColor = UIColor.white.cgColor
        self.layer.addSublayer(waveLayer)
        startAnimate(layer: waveLayer)
    }
    
    private func startAnimate(layer: CAShapeLayer) {
        let pathCenter = getPathCenter()
        let animationBeginRadius = getAnimationBeginRadius()
        let animationEndRadius = getAnimationEndRadius()
        
        let beginPath = UIBezierPath(arcCenter: pathCenter, radius: animationBeginRadius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        
        let endPath = UIBezierPath(arcCenter: pathCenter, radius: animationEndRadius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        let rippleAnimation = CABasicAnimation(keyPath: "path")
        
        rippleAnimation.delegate = self
        rippleAnimation.fromValue = beginPath.cgPath
        rippleAnimation.toValue = endPath.cgPath
        rippleAnimation.duration = duration
    
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.delegate = self
        opacityAnimation.fromValue = opacityFromValue
        opacityAnimation.toValue = opacityToValue
        opacityAnimation.duration = duration
        
        layer.add(rippleAnimation, forKey: "rippleAnimation")
        layer.add(opacityAnimation, forKey: "opacityAnimation")
    }
    
    private func getAnimationBeginRadius() -> CGFloat {
        return waveSize.width * 0.8 * 0.2
    }
    
    private func getAnimationEndRadius() -> CGFloat {
        return waveSize.width * 1
    }
    
    private func getPathCenter() -> CGPoint {
        let x = waveSize.width * 0.5
        let y = waveSize.height * 0.5
        return CGPoint(x: x, y: y)
    }
}

extension EffectAnimateView: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            removeFromSuperview()
        }
    }
}
