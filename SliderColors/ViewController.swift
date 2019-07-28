//
//  ViewController.swift
//  SliderColors
//
//  Created by Anton Kuznetsov on 7/26/19.
//  Copyright © 2019 AntonKuznetsov. All rights reserved.
//

import UIKit

struct Color {
    var red: Float = 127
    var green: Float = 127
    var blue: Float = 127
    var alpha: Float = 1
}

class ViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    var color = Color()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        startUIsettings()
        createToolBar()
    }
    
    @IBAction func redSliderAction() {
        color.red = redSlider.value
        changeMainViewColor(color: self.color)
        updateUI()
    }
    
    @IBAction func greenSliderAction() {
        color.green = greenSlider.value
        changeMainViewColor(color: self.color)
        updateUI()
    }
   
    
    @IBAction func blueSliderAction() {
        color.blue = blueSlider.value
        changeMainViewColor(color: self.color)
        updateUI()
    }
    
    func startUIsettings() {
        redSlider.tintColor = .red
        redSlider.value = color.red
        greenSlider.tintColor = .green
        greenSlider.value = color.green
        blueSlider.tintColor = .blue
        blueSlider.value = color.blue
        
        redLabel.text = "\(Int(color.red))"
        greenLabel.text = "\(Int(color.green))"
        blueLabel.text = "\(Int(color.blue))"
        
        redTextField.keyboardType = .numberPad
        redTextField.text = "\(Int(color.red))"
        greenTextField.keyboardType = .numberPad
        greenTextField.text = "\(Int(color.green))"
        blueTextField.keyboardType = .numberPad
        blueTextField.text = "\(Int(color.blue))"
        
        mainView.layer.cornerRadius = mainView.frame.width / 20
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOpacity = 0.75
        mainView.layer.shadowOffset = CGSize(width: 5, height: 5)
        mainView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        mainView.layer.borderWidth = 1
        
        mainView.backgroundColor = UIColor(red: CGFloat(color.red)/255,
                                           green: CGFloat(color.green)/255,
                                           blue: CGFloat(color.blue)/255,
                                           alpha: CGFloat(color.alpha))
    }
    
    func createToolBar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneButtonPressed))
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        
        redTextField.inputAccessoryView = toolbar
        greenTextField.inputAccessoryView = toolbar
        blueTextField.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonPressed() {
        textFieldChangeColor()
        view.endEditing(true)
    }
    
    func changeMainViewColor(color: Color) {
        let uiColor = UIColor(red: CGFloat(color.red)/255,
                              green: CGFloat(color.green)/255,
                              blue: CGFloat(color.blue)/255,
                              alpha: CGFloat(color.alpha))
        mainView.backgroundColor = uiColor
    }
    
    func updateUI() {
        let redValueStr = String(format: "%.0f", color.red)
        let greenValueStr = String(format: "%.0f", color.green)
        let blueValueStr = String(format: "%.0f", color.blue)
        redSlider.value = color.red
        greenSlider.value = color.green
        blueSlider.value = color.blue
        redLabel.text = redValueStr
        redTextField.text = redValueStr
        greenLabel.text = greenValueStr
        greenTextField.text = greenValueStr
        blueLabel.text = blueValueStr
        blueTextField.text = blueValueStr
    }
    
    func textFieldChangeColor() {
        color.red = Float("\(redTextField.text!)")!
        color.green = Float("\(greenTextField.text!)")!
        color.blue = Float("\(blueTextField.text!)")!
        
        updateUI()
        changeMainViewColor(color: self.color)
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        if newText.isEmpty {
            return true
        }
        else if let floatValue = Float(newText), floatValue <= 255 {
            return true
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
}
