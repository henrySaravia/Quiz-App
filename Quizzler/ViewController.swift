//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import ProgressHUD
class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var numberQuestions: Int = 0
    var pickedAnswer: Bool = false
    var score: Int = 0
    var labelCount: Int = 1
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        nextQuestion()
    }
    
    func updateUI() {
        questionLabel.text = allQuestions.list[numberQuestions].question
        scoreLabel.text = "\(score)"
        progressLabel.text = "\(labelCount)/\(allQuestions.list.count)"
        UIView.animate(withDuration: 0.5) {
            self.progressWidth.constant = (self.view.frame.size.width / 13) * CGFloat(self.numberQuestions + 1)
        }
    }
    
    func nextQuestion() {
        if numberQuestions < allQuestions.list.count - 1 {
            numberQuestions += 1
            labelCount += 1
            updateUI()
        } else {
            let alert = UIAlertController(title: "Awesome", message: "You want to Restart", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { UIAlertAction in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }

    func checkAnswer() {
        if pickedAnswer == allQuestions.list[numberQuestions].answer {
            score += 1
            updateUI()
            ProgressHUD.showSuccess("Correct")
        } else {
            ProgressHUD.showError("Wrong")
        }
    }
    
    func startOver() {
        numberQuestions = 0
        score = 0
        labelCount = 1
        updateUI()
    }
    
}
