//
//  MyTapView.swift
//  tapEffect
//
//  Created by Willy Chen on 2020/3/18.
//  Copyright © 2020 Willy Chen. All rights reserved.
//

import UIKit

public protocol TapRippleAnimationViewDelegate: class {
    func tapRippleAnimationViewAction(_ view: TapRippleAnimationView)
}

open class TapRippleAnimationView: UIView {
    open weak var delegate: TapRippleAnimationViewDelegate?
    open var duration = 0.5
    open var opacityFromValue = 0.3
    open var opacityToValue = 0.0
    open var waveSize: CGSize = CGSize.zero
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initParameter()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        initParameter()
    }
    
    private func initParameter() {
        let waveTap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        waveTap.numberOfTapsRequired = 1
        addGestureRecognizer(waveTap)
        
        isMultipleTouchEnabled = true
        self.layer.masksToBounds = true
    }
    
    //MARK: - Tap Action
    @objc func tapAction(_ sender: UITapGestureRecognizer) {
        let center = sender.location(in: sender.view)
        showWave(center: center)
        delegate?.tapRippleAnimationViewAction(self)
    }
    
    //MARK: - Show Wave
    private func showWave(center: CGPoint) {
        let waveView = EffectAnimateView(center: center)
        waveView.duration = duration
        waveView.opacityToValue = opacityToValue
        waveView.opacityFromValue = opacityFromValue
        
        if self.waveSize == .zero {
            if UIDevice.current.userInterfaceIdiom == .pad {
                self.waveSize = CGSize(width: 800, height: 800)
            } else {
                self.waveSize = CGSize(width: 400, height: 400)
            }
        }

        waveView.waveSize = self.waveSize
        addSubview(waveView)
    }
}
