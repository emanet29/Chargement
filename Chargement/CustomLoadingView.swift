//
//  CustomLoadingView.swift
//  Chargement
//
//  Created by Snoopy on 21/08/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit

class CustomLoadingView: UIView, CAAnimationDelegate {
    
    var shapeLayer: CAShapeLayer?
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
    }
    
    func cercle() -> UIBezierPath {
        let rect = CGRect(x: 5, y: 5, width: frame.width - 10, height: frame.height - 10)
        return UIBezierPath(ovalIn: rect)
    }
    
    /*override func draw(_ rect: CGRect) {
        let path = cercle()
        UIColor.clear.setFill()
        path.fill()
        
        UIColor.black.setStroke()
        path.stroke()
        
    }*/
    
    func initialiserShape() {
        shapeLayer = CAShapeLayer()
        shapeLayer?.path = cercle().cgPath
        shapeLayer?.backgroundColor = UIColor.clear.cgColor
        shapeLayer?.fillColor = nil
        shapeLayer?.strokeColor = UIColor.black.cgColor
        shapeLayer?.lineWidth = 5
        shapeLayer?.strokeEnd = 0
        
        labelCreation()
        
        shapeLayer?.add(animation(), forKey: "strokeEnd")
        layer.addSublayer(shapeLayer!)
        
    }
    
    func animation() -> CABasicAnimation {
        let anim = CABasicAnimation(keyPath: "strokeEnd")
        
        anim.fromValue = 0
        anim.toValue = 1
        anim.duration = 4
        anim.isRemovedOnCompletion = false
        anim.fillMode = kCAFillModeForwards
        anim.isAdditive = true
        anim.delegate = self
        
        return anim
        
    }
    
    func labelCreation() {
        label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        addSubview(label)
    }
    
    func animationDidStart(_ anim: CAAnimation) {
        label.text = "Chargement"
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        label.text = "Fini"
        remiseAZero()
    }
    
    func remiseAZero() {
        
        _ = Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { (t) in
            self.shapeLayer?.strokeEnd = 0
            self.shapeLayer?.removeAllAnimations()
            self.label.text = ""
        })
    }
    
    
    
    
    
    
}
