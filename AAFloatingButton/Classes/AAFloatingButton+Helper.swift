//
//  AAFloatingButton+Helper.swift
//  AAFloatingButton
//
//  Created by M. Ahsan Ali on 13/03/2019.
//

import UIKit

public extension UIView {
    
    @discardableResult
    func aa_addFloatingButton(_ title: String, _ color: UIColor, size: CGFloat, bottomMargin: CGFloat, callback: @escaping (() -> ())) -> AAFloatingButton {
        let fab = AAFloatingButton()
        fab.setTitle(title, for: .normal)
        fab.buttonBackgroundColor = color
        fab.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(fab)
        fab.constantConstaint(attr: .height, constant: size)
        fab.constantConstaint(attr: .width, constant: size)
        self.constraint(view1: fab, view2: self, attr1: .trailing, attr2: .trailing, constant: -bottomMargin)
        self.constraint(view1: fab, view2: self, attr1: .bottom, attr2: .bottom, constant: -bottomMargin)
        fab.add(for: .touchUpInside, callback)
        return fab
    }

}

fileprivate extension UIView {
    func constantConstaint(attr: NSLayoutConstraint.Attribute, constant: CGFloat) {
            self.addConstraint(NSLayoutConstraint(item: self, attribute: attr, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: constant))
        }
    
    func constraint(view1: UIView, view2: UIView, attr1: NSLayoutConstraint.Attribute, attr2: NSLayoutConstraint.Attribute, constant: CGFloat) {
        self.addConstraint(NSLayoutConstraint(item: view1, attribute: attr1, relatedBy: .equal, toItem: view2, attribute: attr2, multiplier: 1, constant: constant))
    }
}


class AAClosureSleeve {
    let closure: ()->()

    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }

    @objc func invoke () {
        closure()
    }
}

extension UIControl {
    func add (for controlEvents: UIControl.Event, _ closure: @escaping ()->()) {
        let sleeve = AAClosureSleeve(closure)
        addTarget(sleeve, action: #selector(AAClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, String(format: "[%d]", arc4random()), sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}


extension AAFloatingButton {
    func addKeyboardListners() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardListners() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {

        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            translateButton(moveDistance: keyboardHeight, up: false)

        }
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            translateButton(moveDistance: keyboardHeight, up: true)

        }
        
    }

    func translateButton(moveDistance: CGFloat, up: Bool) {
        let moveDuration = 0.25
        let movement: CGFloat = up ? moveDistance: -moveDistance
        UIView.beginAnimations(keyPath, context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.frame = self.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
}
