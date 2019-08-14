//
//  ViewController.swift
//  AnyLVL
//
//  Created by Roman Kharchenko on 08/08/2019.
//  Copyright © 2019 Roman Kharchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Кнопки
    
    let buttonBoost = UIButton()
    let buttonCalibration = UIButton()
    let buttonLowPriotity = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       assignbackground()
        
       
        // Буст рейтинга ( кнопка )
        self.buttonBoost.frame = CGRect(x: 90, y: 190, width: 200, height: 70)
        self.buttonBoost.backgroundColor = UIColor.orange
        self.buttonBoost.setTitle("Буст рейтинга", for: .normal)
        self.view.addSubview(self.buttonBoost)
        
        self.buttonBoost.addTarget(self, action: #selector(goBoost(sender:)), for: .touchUpInside)
        
        //Калибровка ( кнопка )
        self.buttonCalibration.frame = CGRect(x: 90, y: 290, width: 200, height: 70)
        self.buttonCalibration.backgroundColor = UIColor.orange
        self.buttonCalibration.setTitle("Калибровка", for: .normal)
        self.view.addSubview(self.buttonCalibration)
        
        self.buttonCalibration.addTarget(self, action: #selector(goCalibration(sender:)), for: .touchUpInside)
        
        //Калибровка ( кнопка )
        self.buttonLowPriotity.frame = CGRect(x: 90, y: 390, width: 200, height: 70)
        self.buttonLowPriotity.backgroundColor = UIColor.orange
        self.buttonLowPriotity.setTitle("Слить ЛП", for: .normal)
        self.view.addSubview(self.buttonLowPriotity)
        
        self.buttonLowPriotity.addTarget(self, action: #selector(goLowPriority(sender:)), for: .touchUpInside)
    }
    
    //Переход к бусту
    @objc func goBoost (sender:UIButton) {
        let viewController2 = ViewController2()
        self.present(viewController2, animated: true, completion: nil)
    }
    
    // Переход к Калибровке
    @objc func goCalibration (sender:UIButton) {
        let viewController3 = ViewController3()
        self.present(viewController3, animated: true, completion: nil)
    }
    
    //Переход к сливу ЛП
    @objc func goLowPriority (sender:UIButton) {
        let viewController4 = ViewController4()
        self.present(viewController4, animated: true, completion: nil)
    }
    
    func assignbackground(){
        let background = UIImage(named: "background.jpg")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }

}

