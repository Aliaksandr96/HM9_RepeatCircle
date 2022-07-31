//
//  ViewController.swift
//  SlideImage
//
//  Created by Aliaksandr Hunko on 31/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let arrayImage = ["Chelsea", "ManUn", "ManCity","Liv"]
    let imageView = UIImageView()
    let background = UIImageView()
    var currentImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setupLayout()
        setupAppearance()
        setupBlur()
        
    }
    //MARK: - Setup Layout
    
    func setupLayout() {
        background.frame = view.frame
        background.center = view.center
        
        background.image = UIImage(named: arrayImage[currentImage])
        view.addSubview(background)
        
        imageView.image = UIImage(named: arrayImage[currentImage])
        view.addSubview(imageView)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(pastImage))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
    
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(nextImage))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
    }
    //MARK: - Setup Appearance
    
    func setupAppearance() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    //MARK: - Blur Effect
    
    func setupBlur() {
        let blurStyle = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurView = UIVisualEffectView(effect: blurStyle)
        blurView.frame = background.bounds
        background.addSubview(blurView)
        
    }
    
    @objc func nextImage(){
        if currentImage == arrayImage.count - 1 {
            currentImage = 0
        } else {
            currentImage += 1
        }
        imageView.image = UIImage(named: arrayImage[currentImage])
        background.image = UIImage(named: arrayImage[currentImage])
    }
    @objc func pastImage(){
        if currentImage == 0 {
            currentImage = arrayImage.count - 1
        } else {
            currentImage -= 1
        }
        imageView.image = UIImage(named: arrayImage[currentImage])
        background.image = UIImage(named: arrayImage[currentImage])
}
}
