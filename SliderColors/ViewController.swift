//
//  ViewController.swift
//  SliderColors
//
//  Created by Anton Kuznetsov on 7/26/19.
//  Copyright © 2019 AntonKuznetsov. All rights reserved.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func redSliderAction() {
        let valueStr = String(format: "%.2f", redSlider.value)
        redLabel.text = valueStr
        redTextField.placeholder = valueStr
    }
    
    @IBAction func greenSliderAction() {
        let valueStr = String(format: "%.2f", greenSlider.value)
        greenLabel.text = valueStr
        greenTextField.placeholder = valueStr
    }
    
    @IBAction func blueSliderAction() {
        let valueStr = String(format: "%.2f", blueSlider.value)
        blueLabel.text = valueStr
        blueTextField.placeholder = valueStr
    }
    
    func updateUI() {
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        blueSlider.tintColor = .blue
        
        redLabel.text = "\(redSlider.value)"
        greenLabel.text = "\(greenSlider.value)"
        blueLabel.text = "\(blueSlider.value)"
    }
}
