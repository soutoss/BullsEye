//
//  ViewController.swift
//  BullsEye
//
//  Created by Thiago Souto on 29/03/18.
//  Copyright © 2018 Thiago Souto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(){
        let alert  = UIAlertController(title: "Opa", message: "Tudo bem ?", preferredStyle: .alert)
        let action = UIAlertAction(title : "Incrivel",style: .default, handler : nil)
        alert.addAction(action)
        
        present(alert, animated: true,completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        
    }
    
    
}

