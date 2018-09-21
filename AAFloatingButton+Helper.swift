//
//  AAFloatingButton+Helper.swift
//  AAFloatingButton
//
//  Created by MacBook Pro on 22/09/2018.
//

// MARK: - Animations of ripple
extension AAFloatingButton {
    
    func reverseRipple(){
        UIView.animate(withDuration: 0.1,
                       animations: { self.rippleBackgroundView.alpha = 1 },
                       completion: { _ in self.removeRipple() })
        
        UIView.animate(withDuration: 0.3, delay: 0,
                       options: .curveEaseOut,
                       animations: { self.addRipple(true) },
                       completion: nil)
    }
    
    func removeRipple() {
        UIView.animate(withDuration: 0.6 ,
                       animations: { self.rippleBackgroundView.alpha = 0 },
                       completion: nil)
    }
    
    func showRipple() {
        UIView.animate(withDuration: 0.1,
                       animations: { self.rippleBackgroundView.alpha = 1 },
                       completion: nil)
        rippleView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut,
                       animations: { self.rippleView.transform = .identity },
                       completion: nil)
    }
    
    func addRipple(_ reverse: Bool) {
        self.rippleView.transform = .identity
        
        let shadowAnim = CABasicAnimation(keyPath:"shadowRadius")
        shadowAnim.toValue = reverse ? tempShadowRadius : shadowRippleRadius
        
        let opacityAnim = CABasicAnimation(keyPath:"shadowOpacity")
        opacityAnim.toValue = reverse ? tempShadowOpacity : 1
        
        let groupAnim = CAAnimationGroup()
        groupAnim.duration = 0.7
        groupAnim.fillMode = kCAFillModeForwards
        groupAnim.isRemovedOnCompletion = false
        groupAnim.animations = [shadowAnim, opacityAnim]
        
        self.layer.add(groupAnim, forKey: self.keyPath)
        
    }
    
}

extension UIView {
    func roundCorners() {
        layer.cornerRadius = 0.5 * frame.height
    }
}
