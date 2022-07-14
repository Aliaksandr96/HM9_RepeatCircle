//
//  ViewController.swift
//  HM9_1
//
//  Created by Aliaksandr Hunko on 13/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let Rectangle = UIView()
    let Circle = UIView()
    
    let widthCircle: CGFloat = 70
    let heightCircle: CGFloat = 70
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
        // Create Background Area
        
        Rectangle.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        Rectangle.center = view.center
        Rectangle.backgroundColor = .systemGray
        view.addSubview(Rectangle)
        
        // Create Circle
        
        Circle.frame = CGRect(x: Rectangle.bounds.maxX / 2 - widthCircle / 2, y: Rectangle.bounds.minY , width: widthCircle, height: heightCircle)
        Circle.backgroundColor = .systemOrange
        Circle.clipsToBounds = true
        Circle.layer.cornerRadius = 35
        Rectangle.addSubview(Circle)
        
        moveCircle()
        
    }
    
    func moveCircle() {
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear){
            
            self.Circle.frame = CGRect(x: self.Rectangle.bounds.maxX / 2 - self.widthCircle / 2, y: self.Rectangle.bounds.minY , width: self.widthCircle, height: self.heightCircle)
            
        } completion: { _ in
            
            self.moveCircle1()
            
        }
    }
    
    func moveCircle1() {
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear){
            
            self.Circle.frame = CGRect(x: self.Rectangle.bounds.maxX - self.widthCircle, y: self.Rectangle.bounds.maxY / 2 - self.heightCircle / 2, width: self.widthCircle, height: self.heightCircle)
            
        } completion: { _ in
            
            self.moveCircle2()
            
        }
    }
    
    func moveCircle2() {
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear){
            
            self.Circle.frame = CGRect(x: self.Rectangle.bounds.maxX / 2 - self.widthCircle / 2, y: self.Rectangle.bounds.maxY - self.heightCircle, width: self.widthCircle, height: self.heightCircle)
            
        } completion: { _ in
            
            self.moveCircle3()
            
        }
    }
    
    func moveCircle3() {
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear){
            
            self.Circle.frame = CGRect(x: self.Rectangle.bounds.minX, y: self.Rectangle.bounds.maxY / 2 - self.heightCircle / 2, width: self.widthCircle, height: self.heightCircle)
            
        } completion: { _ in
            
            self.moveCircle()
        }
    }
}
