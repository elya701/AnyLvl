//
//  ViewController4.swift
//  AnyLVL
//
//  Created by Roman Kharchenko on 08/08/2019.
//  Copyright © 2019 Roman Kharchenko. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
    // Экземляторы
    let ourTextField = UILabel()
    let ourButton = UIButton()
    let ourButton2 = UIButton()
    let ourButton3 = UIButton()
    let ourTextField2 = UILabel()
    let ourTextField3 = UILabel()
    let ourTextField4 = UILabel()
    let ourSwitch = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        
        //Кнопки
        
        self.ourButton.frame = CGRect(x: 90, y: 450, width: 215, height: 70)
        self.ourButton.backgroundColor = UIColor.orange
        self.ourButton.setTitle("Рассчитать калибровку", for: .normal)
        self.view.addSubview(ourButton)
        
        self.ourButton.addTarget(self, action: #selector(alert(sender:)) , for: .touchUpInside)
        
        self.ourButton2.frame = CGRect(x: 285, y: 625, width: 85, height: 30)
        self.ourButton2.backgroundColor = UIColor.gray
        self.ourButton2.setTitle("Очистить", for: .normal)
        self.view.addSubview(ourButton2)
        
        self.ourButton2.addTarget(self, action: #selector(alert2(sender:)) , for: .touchUpInside)
        
        self.ourButton3.frame = CGRect(x: 5, y: 625, width: 85, height: 30)
        self.ourButton3.backgroundColor = UIColor.gray
        self.ourButton3.setTitle("Назад", for: .normal)
        self.view.addSubview(ourButton3)
        
        self.ourButton3.addTarget(self, action: #selector(alert3(sender:)) , for: .touchUpInside)
        
        
        
        // Switch
        
        self.ourSwitch.frame = CGRect(x: 160, y: 400, width: 100, height: 100)
        self.view.addSubview(ourSwitch)
        
        
        
        
        // Наши поля
        
        ourTextField.frame = CGRect(x: 90, y: 80, width: 200, height: 100)
        ourTextField.text = ""
        ourTextField.textColor = UIColor.white
        
        view.addSubview(ourTextField)
        
        ourTextField2.frame = CGRect(x: 90, y: 150, width: 200, height: 100)
        ourTextField2.text = ""
        ourTextField2.textColor = UIColor.white
        
        view.addSubview(ourTextField2)
        
        ourTextField4.frame = CGRect(x: 90, y: 200, width: 200, height: 100)
        ourTextField4.text = ""
        ourTextField4.textColor = UIColor.white
        
        view.addSubview(ourTextField4)
        
        
        
        ourTextField3.frame = CGRect(x: 90, y: 320, width: 250, height: 100)
        ourTextField3.text = "Cделать быстрее ( +20% )"
        ourTextField3.textColor = UIColor.green
        
        view.addSubview(ourTextField3)
    }
    
    
    // Присвоить BG
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
    
    // Главная кнопка ( фукнция при нажатии )
    @objc func alert (sender:UIButton) {
        ourAlert(title: "Предыдущий рейтинг", message: "Если был, иначе 0", style: .alert)
        ourTextField.text = ""
        ourTextField2.text = ""
        ourTextField4.text = ("")
    }
    
    
    // Очистить
    @objc func alert2 (sender:UIButton) {
        ourTextField.text = ""
        ourTextField2.text = ""
        ourTextField4.text = ("")
    }
    
    // Переход на главный экран
    @objc func alert3 (sender:UIButton) {
        let viewController = ViewController()
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Вызов Алерта
    func ourAlert ( title:String, message:String, style:UIAlertController.Style ) {
        let buttonAlert = UIAlertController(title: title, message: message, preferredStyle: style)
        let buttonAction = UIAlertAction(title: "Подтвердить", style: .default) { (buttonAction) in
            
            // Переменные
            let text = buttonAlert.textFields?.first
            let text2 = (text?.text)!
            let text3 = Int(text2) ?? 0
            let coast:Double = Double(text3) * 3.25
            var mmr = 0
            var day = 0
            
            //Считаем дни
            if text3 < 2001 {
                day += 2
            } else if text3 < 5001 && text3 > 2000 {
                day += 3
            } else if text3 < 7501 && text3 > 5000 {
                day += 4
            } else {
                day += 5
            }
            
            // Алгоритм калибровки
            if text3 != 0 {
                if text3 <= 2500 {
                mmr = text3 + 1500
                } else if text3 <= 5000 && text3 > 2500 {
                     mmr = text3 + 1000
                } else if text3 <= 7500 && text3 > 5000 {
                     mmr = text3 + 600
                } else {
                     mmr = text3 + 350
                }
            }
            else {
                mmr = 0
            }
            
            //  Алгоритм проверки ММР + работы Switch и тд
            
        if self.ourSwitch.isOn {
            if (text3 <= 10000) {
                day -= 1
                self.ourTextField.text! += ("Твой ММР будет \(mmr)")
                self.ourTextField2.text! += ("Цена: \(coast * 1.2) рублей")
                self.ourTextField4.text! += ("Срок: \(day) дня")
            } else {
                self.ourTextField.text! += ("Некорректный ММР!")
                self.ourTextField2.text! += ("")
                self.ourTextField4.text! += ("")
                
            }
            
        } else {
            if (text3 <= 10000){
                self.ourTextField.text! += ("Твой ММР будет \(mmr)")
                self.ourTextField2.text! += ("Цена: \(coast) рублей")
                self.ourTextField4.text! += ("Срок: \(day) дня")
            } else {
                self.ourTextField.text! += ("Некорректный ММР!")
                self.ourTextField2.text! += ("")
                self.ourTextField4.text! += ("")
                
            }
        }
    }

            
        buttonAlert.addTextField { (textField) in
        }
        
            buttonAlert.addAction(buttonAction)
        self.present(buttonAlert, animated: true, completion: nil)
        }
        
    }


