//
//  CurrencyConverterViewController.swift
//  AnyLVL
//
//  Created by Anton Kharchenko on 8/14/19.
//  Copyright © 2019 Roman Kharchenko. All rights reserved.
//

import UIKit

class CurrencyConverterViewControllerUSD: UIViewController {
    @IBOutlet weak var currencyTextField: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    
    @IBAction func textfieldTextChanged(_ sender: Any) {
        convertButton.isEnabled = canParse(userInput: currencyTextField.text ?? "")
    }
    
    @IBAction func convert(_ sender: Any) {
        if let bynValue = convertCurrency() {
            showConvertedResult(bynValue)
        } else {
            showErrorResult()
        }
    }
    
    private func showConvertedResult(_ result: Double) {
        showAlert(with: "\(result) BYN")
    }
    
    private func showErrorResult() {
        showAlert(with: "Ошибка")
    }
    
    private func showAlert(with message: String) {
        let controller = UIAlertController(
            title: nil,
            message: message,
            preferredStyle: .alert
        )
        
        controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        
        self.present(controller, animated: true)
    }
    
    // Проверяем, корректно ли введена сумма
    private func canParse(userInput: String) -> Bool {
        return Double(userInput) != nil
    }
    
    private func convertCurrency() -> Double? {
        guard let userInput = currencyTextField.text, let usd = Double(userInput) else { return nil }
        return convertFromUSD(value: usd)
    }
    
    private func convertFromUSD(value: Double) -> Double {
        return value * 2.04
    }
}

class CurrencyConverterViewControllerRUB: UIViewController {
    @IBOutlet weak var currencyTextField: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    
    @IBAction func textfieldTextChanged(_ sender: Any) {
        convertButton.isEnabled = canParse(userInput: currencyTextField.text ?? "")
    }
    
    @IBAction func convert(_ sender: Any) {
        if let bynValue = convertCurrency() {
            showConvertedResult(bynValue)
        } else {
            showErrorResult()
        }
    }
    
    private func showConvertedResult(_ result: Double) {
        showAlert(with: "\(result) BYN")
    }
    
    private func showErrorResult() {
        showAlert(with: "Ошибка")
    }
    
    private func showAlert(with message: String) {
        let controller = UIAlertController(
            title: nil,
            message: message,
            preferredStyle: .alert
        )
        
        controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        
        self.present(controller, animated: true)
    }
    
    // Проверяем, корректно ли введена сумма
    private func canParse(userInput: String) -> Bool {
        return Int(userInput) != nil
    }
    
    private func convertCurrency() -> Double? {
        guard let userInput = currencyTextField.text, let usd = Double(userInput) else { return nil }
        return convertFromUSD(value: usd)
    }
    
    private func convertFromUSD(value: Double) -> Double {
        return value * 0.031
    }
}
