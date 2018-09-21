//
//  AAFloatingButton.swift
//  AAFloatingButton
//
//  Created by Engr. Ahsan Ali on 16/02/2018.
//  Copyright © 2017 AA-Creations. All rights reserved.
//
import UIKit
import QuartzCore

/// AAFloatingButton as UIButton
open class AAFloatingButton: UIButton {

    let keyPath = "AAFloatingButton"
    
    let rippleView = UIView()
    
    let rippleBackgroundView = UIView()
    
    var tempShadowRadius: CGFloat = 0
    
    var tempShadowOpacity: Float = 0
    
    @IBInspectable public var rippleOverBounds: Bool = false
    
    @IBInspectable public var shadowRippleRadius: Float = 1
    
    @IBInspectable public var shadowRippleEnable: Bool = true
    
    @IBInspectable public var trackTouchLocation: Bool = false
    
    @IBInspectable public var buttonBackgroundColor: UIColor = .blue
    
    @IBInspectable public var ripplePercent: Float = 2.0 {
        didSet {
            setRippleView()
        }
    }
    
    @IBInspectable public var rippleColor: UIColor = UIColor(white: 0.9, alpha: 1) {
        didSet {
            rippleView.backgroundColor = rippleColor
        }
    }
    
    @IBInspectable public var rippleBackgroundColor: UIColor = UIColor(white: 0.95, alpha: 1) {
        didSet {
            rippleBackgroundView.backgroundColor = rippleBackgroundColor
        }
    }
    
    var rippleMask: CAShapeLayer? {
        get {
            if !rippleOverBounds {
                let maskLayer = CAShapeLayer()
                maskLayer.path = UIBezierPath(roundedRect: bounds,
                                              cornerRadius: layer.cornerRadius).cgPath
                return maskLayer
            } else {
                return nil
            }
        }
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        setRippleView()
        
        let oldCenter = rippleView.center
        rippleView.center = oldCenter
        
        rippleBackgroundView.layer.frame = bounds
        rippleBackgroundView.layer.mask = rippleMask
        rippleBackgroundView.roundCorners()
        
    }

    open override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        buttonBackgroundColor.setFill()
        path.fill()
    }
    
    override open func beginTracking(_ touch: UITouch, with  event: UIEvent?) -> Bool {
        if trackTouchLocation {
            rippleView.center = touch.location(in: self)
        }
        showRipple()
        if shadowRippleEnable {
            tempShadowRadius = layer.shadowRadius
            tempShadowOpacity = layer.shadowOpacity
            addRipple(false)
        }
        return super.beginTracking(touch, with: event)
    }
    
    open override func cancelTracking(with event: UIEvent?) {
        super.cancelTracking(with: event)
        reverseRipple()
    }
    
    override open func endTracking(_ touch: UITouch?, with  event: UIEvent?) {
        super.endTracking(touch, with: event)
        reverseRipple()
    }
    
}

// MARK: - Set frames
extension AAFloatingButton {
    
    func setup() {
        setFrame()
        setRippleView()
        rippleBackgroundView.backgroundColor = rippleBackgroundColor
        rippleBackgroundView.frame = bounds
        layer.addSublayer(rippleBackgroundView.layer)
        
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        
        rippleBackgroundView.layer.addSublayer(rippleView.layer)
        rippleBackgroundView.alpha = 0
    }
    
    func setFrame(){
        
        var dim: CGFloat = UIScreen.main.bounds.height / 8
        var y: CGFloat = UIScreen.main.bounds.height - dim - 20
        var x: CGFloat = UIScreen.main.bounds.width - dim - 20
        
        if(UIDeviceOrientationIsLandscape(UIDevice.current.orientation)) {
            dim = UIScreen.main.bounds.height / 6
            y = UIScreen.main.bounds.height - dim - 20
            x = UIScreen.main.bounds.width - dim - 20
        }
        
        let newFrame: CGRect = CGRect(x: 0, y: 0, width: dim, height: dim)
        
        self.frame = newFrame
        self.frame = CGRect(x: x, y: y, width: self.frame.height, height: self.frame.height)
        self.roundCorners()
    }
    
    func setRippleView() {
        
        let size: CGFloat = bounds.width * CGFloat(ripplePercent)
        let x: CGFloat = (bounds.width/2) - (size/2)
        let y: CGFloat = (bounds.height/2) - (size/2)
        
        rippleView.backgroundColor = rippleColor
        rippleView.frame = CGRect(x: x, y: y, width: size, height: size)
        rippleView.roundCorners()
    }
    
}
