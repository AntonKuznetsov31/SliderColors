//
//  MainViewController.swift
//  SliderColors
//
//  Created by Anton Kuznetsov on 8/13/19.
//  Copyright © 2019 AntonKuznetsov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! SlidersViewController
        dvc.colorFromMainVC = view.backgroundColor
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        let colorVC = segue.source as! SlidersViewController
        colorVC.delegate = self
        colorVC.setColor()
    }
}

extension MainViewController: ViewDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
