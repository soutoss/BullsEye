//
//  ViewController.swift
//  BullsEye
//
//  Created by Thiago Souto on 29/03/18.
//  Copyright © 2018 Thiago Souto. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    var currentValue : Int = 0
    var targetValue  = 0
    var currentScore = 0
    var currentRound = 0
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var roundsLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    fileprivate func updateLabels() {
        scoreLabel.text = String(currentScore)
        roundsLabel.text = String(currentRound)
        targetLabel.text = String(targetValue)
        scoreLabel.text  = String(currentScore)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateValues()
        updateLabels()
    }
    
    @IBAction func showAlert(){
        let pontuation = (100 -  abs(targetValue - currentValue))
        currentScore += pontuation
        if(targetValue == currentValue){
            showAlert(title: "Parabéns!", message: "Dedo maroto hein?? acertasse, parabéns!", actionName:"Fechar", fun : startNewRound)
        }else{
            showAlert(title: "Vixi!", message: "Sua pontuação foi:  \(pontuation)" , actionName:  "Tentar novamente!", fun : startNewRound)
        }
    }
    
    fileprivate func updateValues() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    
    func startNewRound(_alert : UIAlertAction){
        currentRound += 1
        updateValues()
        
        updateLabels()
        
    }
    
    
    private func showAlert(title: String, message: String, actionName: String, fun: ((UIAlertAction) -> Swift.Void)? = nil) {
        let alert = UIAlertController(title: title,message: message, preferredStyle: .alert)
        let action = UIAlertAction(title : actionName,style: .default, handler: fun)
        alert.addAction(action)
        present(alert, animated : true, completion: nil)
    }
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
}

