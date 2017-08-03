//
//  ViewController.swift
//  Algebra Additions Testing
//
//  Created by Shaan Mirchandani
//  Copyright © 2017 Shaan Mirchandani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblTitleOUTLET: UILabel!
    @IBOutlet weak var lblQuestionOUTLET: UILabel!
    @IBOutlet weak var txtInputOUTLET: UITextField!
    @IBOutlet weak var btnCheckAnswerOUTLET: UIButton!
    @IBOutlet weak var lblRightOrWrongOUTLET: UILabel!
    @IBOutlet weak var lblProgressOUTLET: UILabel!
    
       var userAnswer: Int?
    var correctAnswer: Int?
    var progress: Int = 0
    var difficulty: String = "easy"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        chooseQuestionNumbers(difficultyLevel: "easy")
    }

    
    @IBAction func checkAnswerACTION(_ sender: UIButton) {
        if let _ = Int(txtInputOUTLET.text!){
            userAnswer = Int(txtInputOUTLET.text!)!
            
            checkIfCorrect()
        }
        txtInputOUTLET.text?.removeAll()
        
    }
    
    func chooseQuestionNumbers(difficultyLevel: String){
        var randomNumber : Int?
        var lastRandomNumber: Int?

        switch difficultyLevel {
        case "easy":
            randomNumber = 1 + Int(arc4random_uniform(4))
            if (randomNumber == lastRandomNumber){
                chooseQuestionNumbers(difficultyLevel: "easy")
            }
        case "medium":
            randomNumber = 5 + Int(arc4random_uniform(4))
            if (randomNumber == lastRandomNumber){
                chooseQuestionNumbers(difficultyLevel: "medium")
            }
        case "hard":
            randomNumber = 9 + Int(arc4random_uniform(4))
            if (randomNumber == lastRandomNumber){
                chooseQuestionNumbers(difficultyLevel: "Hard")
            }
            
        default:
            break
        }
        
        lastRandomNumber = randomNumber
        correctAnswer = randomNumber! - 1
        lblQuestionOUTLET.text = "1 + x = " + String(randomNumber!)
    }
    
    func checkIfCorrect(){
        if (userAnswer! == correctAnswer!){
            progress += 1
            lblRightOrWrongOUTLET.text = "Correct"
            lblRightOrWrongOUTLET.backgroundColor = UIColor.green
            if (progress == 4){
                switch difficulty {
                case "easy":
                    difficulty = "medium"
                    lblRightOrWrongOUTLET.text = "Correct! Onto medium questions"
                    progress = 0
                    
                case "medium":
                    difficulty = "hard"
                    lblRightOrWrongOUTLET.text = "Correct! Onto hard questions"
                    progress = 0
                default:
                    break
                }
            }
        } else {
            lblRightOrWrongOUTLET.text = "Incorrect"
            lblRightOrWrongOUTLET.backgroundColor = UIColor.red
            
        }
        lblProgressOUTLET.text = String(progress) + "/4 - " + difficulty
        chooseQuestionNumbers(difficultyLevel: difficulty)
        
    }
    
    


}

