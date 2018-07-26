//
//  ImageViewExtension.swift
//  SoundCloud
//
//  Created by Can Khac Nguyen on 7/30/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func setCircleBorder() {
        layer.masksToBounds = false
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }
    
    func rotate360Degrees(duration: CFTimeInterval = 10) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = Float.infinity
        layer.add(rotateAnimation, forKey: nil)
    }
}
