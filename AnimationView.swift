//
//  AnimationView.swift
//  circularProgress
//
//  Created by Dibin Varghees on 03/11/19.
//  Copyright © 2019 Dibin Varghees. All rights reserved.
//

import UIKit

class AnimationView: UIView {

   static let sharedInstance = AnimationView()
    
    let shapelayer = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
  
    override class func awakeFromNib() {
       
    }
    
    fileprivate func setupShapeLayer(_ circularPath: UIBezierPath) {
        shapelayer.path = circularPath.cgPath
        
        shapelayer.strokeColor = UIColor.red.cgColor
        
        shapelayer.lineWidth = 10
        
        shapelayer.strokeEnd = 0
        
        shapelayer.fillColor = UIColor.clear.cgColor
        
        shapelayer.lineCap = CAShapeLayerLineCap.round
        
        shapelayer.position = self.center
        
        self.layer.addSublayer(shapelayer)
        
        shapelayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
    }
    
    fileprivate func animateShapeLayer() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        
        basicAnimation.duration = 2
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        
        basicAnimation.isRemovedOnCompletion = false
        
        basicAnimation.repeatCount = Float.infinity
        
        shapelayer.add(basicAnimation, forKey: "anyStr")
    }
    
    func setupView(){
        
        if let mainWindow = UIApplication.shared.windows.first {
            
            self.frame = mainWindow.bounds
            
            }
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 30, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        let trackLayer = CAShapeLayer()
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.gray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor =  UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        trackLayer.position = self.center
        self.layer.addSublayer(trackLayer)
        
        setupShapeLayer(circularPath)
        
        animateShapeLayer()
        
        
    }
    open func showProgress(){
        
        if let mainWindow = UIApplication.shared.windows.first?.rootViewController {
            setupView()
            
            mainWindow.view.addSubview(self)
        }
        
    }
    open func hideProgress(){
        self.removeFromSuperview()
        //        if let mainWindow = UIApplication.shared.windows.first?.rootViewController {
        //        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  /*  // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }*/
    

}
