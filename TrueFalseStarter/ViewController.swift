//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
   // var indexOfSelectedQuestion: Int = 0
    var indexOfRandomQuestion: Int = 0
    var questionsAskedArray: [Int] = []
    
    var gameSound: SystemSoundID = 0
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var nextQuestion: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        playGameStartSound()
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion() {
        firstButton.hidden = false
        secondButton.hidden = false
        thirdButton.hidden = false
        fourthButton.hidden = false
        
        indexOfRandomQuestion = Int(arc4random_uniform(UInt32(allQuestions.count)))
        var currentQuestion = allQuestions[indexOfRandomQuestion]
        questionField.text = currentQuestion.question
        questionsAskedArray.append(indexOfRandomQuestion)
    
        if questionsAskedArray.contains(indexOfRandomQuestion) {
            indexOfRandomQuestion = Int(arc4random_uniform(UInt32(allQuestions.count)))
            currentQuestion = allQuestions[indexOfRandomQuestion]
            questionField.text = currentQuestion.question
        }
        
        print(currentQuestion.question)
        print(currentQuestion.option1)
        print(currentQuestion.option4)
        
        firstButton.setTitle(currentQuestion.option1, forState: .Normal)
        secondButton.setTitle(currentQuestion.option2, forState: .Normal)
        thirdButton.setTitle(currentQuestion.option3, forState: .Normal)
        fourthButton.setTitle(currentQuestion.option4, forState: .Normal)
        
        if currentQuestion.option3 == nil {
            thirdButton.hidden = true
        }
        
        if currentQuestion.option4 == nil {
            fourthButton.hidden = true
        }
        
        playAgainButton.hidden = true
        nextQuestion.hidden = true
    }
    
    func displayScore() {
        // Hide the answer buttons
        firstButton.hidden = true
        secondButton.hidden = true
        thirdButton.hidden = true
        fourthButton.hidden = true
        nextQuestion.hidden = true
        
        // Display play again button
        playAgainButton.hidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        print(questionsAsked)
        let selectedQuestionDict = allQuestions[indexOfRandomQuestion]
        let correctAnswer = selectedQuestionDict.answer
        nextQuestion.hidden = false
        
        if sender.titleLabel!.text == correctAnswer {
            correctQuestions += 1
            questionField.text = "Boom Shakalaka! You are correct!"
            checkRound()
        } else {
            questionField.text = "Oh noooo! You were wrong!"
            checkRound()
        }
    }
    
    func checkRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        }
    }
    @IBAction func nextQuestionTapped(sender: AnyObject) {
        displayQuestion()
    }
    
    @IBAction func playAgain() {
        questionsAsked = 0
        correctQuestions = 0
        displayQuestion()
    }
    
    
    
    // MARK: Helper Methods
    
    /*func loadNextRoundWithDelay(seconds seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        
        // Executes the nextRound method at the dispatch time on the main queue
        dispatch_after(dispatchTime, dispatch_get_main_queue()) {
            self.nextRound()
        }
    }*/
    
    func loadGameStartSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("GameSound", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    var correctSound: SystemSoundID = 0
    
    func loadCorrectAnswerSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("yay_<", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &correctSound)
    }
    
    func playCorrectAnswerSound() {
        AudioServicesPlaySystemSound(correctSound)
    }
    
    
  /*  var wrongSound: SystemSoundID = 0
    
    func loadWrongAnswerSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource(<#T##name: String?##String?#>, ofType: <#T##String?#>)
    }
    */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

