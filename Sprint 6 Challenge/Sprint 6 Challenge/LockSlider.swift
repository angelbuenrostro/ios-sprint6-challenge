//
//  RangeSlider.swift
//  Sprint 6 Challenge
//
//  Created by Angel Buenrostro on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class LockSlider: UIControl {
    
    var lockValue: CGFloat = 1
    var sliderValue: CGFloat = 0.0
    var dot : [UIView] = []
    var dotMin: CGFloat = 0
    var dotMax: CGFloat = 0
    var dotOriginalX: CGFloat = 0
    
    required init?(coder aCoder: NSCoder){
        super.init(coder: aCoder)
        setUp()
    }
    
    func updateValue(for touch: UITouch){
        
        let touchPoint = touch.location(in: self)
        sliderValue = touchPoint.x
        lockValue = (self.frame.maxX * 0.8) - 30
        print("\(touchPoint)")
        print("Dot x position is: \(dot[0].bounds.minX)")
        
        if self.bounds.contains(touchPoint){
            dot[0].center.x = touchPoint.x
            
            if sliderValue > lockValue {
                touch.view?.isUserInteractionEnabled = false
                sendActions(for: .valueChanged)
                UIView.animateKeyframes(withDuration: 1, delay: 1.5, options: .allowUserInteraction, animations: {
                    self.dot[0].center.x = self.dotOriginalX
                }, completion: nil)
            } else {
                UIView.animate(withDuration: 1) {
                    self.dot[0].center.x = self.dotOriginalX
                }
            
                sendActions(for: .valueChanged)
                print("\(touchPoint)")
                print("Dot x position is: \(dot[0].bounds.minX)")
            }
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        sendActions(for: .touchDown)
        updateValue(for: touch)
        print("begin tracking: touchdown")
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: .touchDragInside)
            updateValue(for: touch)
            print("continue tracking: touchDragInside")
        } else {
            sendActions(for: .touchDragOutside)
            print("continue tracking: touchDragOutside")
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: .touchUpInside)
            print("endTracking: touchUpInside")
        } else {
            sendActions(for: .touchUpOutside)
            print("endTracking: touchUpOutside")
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func setUp(){
        self.layer.cornerRadius = 15
        
        let dotView = UIView()
        dotView.translatesAutoresizingMaskIntoConstraints = false
        dotView.backgroundColor = .black
        self.addSubview(dotView)
        dotMin = self.frame.minX + 5
        dotMax = self.frame.maxX - 5
        dotView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        dotView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
        dotView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -215).isActive = true
        dotView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -8).isActive = true
        dotView.layer.cornerRadius = 15
        dotOriginalX = dotView.center.x + 20
        dot.append(dotView)
        lockValue = (self.frame.width * 0.8) + self.frame.minX
    }

    
    
}
