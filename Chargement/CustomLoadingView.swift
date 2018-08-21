//
//  CustomLoadingView.swift
//  Chargement
//
//  Created by Snoopy on 21/08/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit

class CustomLoadingView: UIView {
    
    var shapeLayer: CAShapeLayer?
    
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
        
        layer.addSublayer(shapeLayer!)
        
    }
    
    
}
