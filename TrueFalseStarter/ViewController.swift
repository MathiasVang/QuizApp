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
    
    //Declaring variables to use out of scope
    var questionsAsked = 0
    var correctQuestions = 0
    var lightningActive = false
    
    let correctAnswerColor = UIColor(red: 85/255.0, green: 176/255.0, blue: 112/255.0, alpha: 1.0)
    let defaultColor = UIColor(red: 12/255.0, green: 121/255.0, blue: 150/255.0, alpha: 1.0)
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var nextQuestion: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var lightningRoundBtn: UIButton!
    @IBOutlet weak var normalRoundBtn: UIButton!
    @IBOutlet weak var timerLabel: UILabel!

    
    //Loading all neccesary items when opening application
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        playGameStartSound()
        loadCorrectAnswerSound()
        loadWrongAnswerSound()
        loadOverSevenCorrectQuestionsSound()
        loadUnderSevenCorrectQuestionSound()
        showMenu()
        //startGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Show the menu and choose gametype
    @IBAction func showMenu() {
        questionField.text = "Choose a gametype"
        hideAllButtons()
        normalRoundBtn.hidden = false
        lightningRoundBtn.hidden = false
        timerLabel.hidden = true
    }
    
    // Starting the game. Getting questions from file: GameLogic and displaying them
    @IBAction func startGame() {
        lightningActive = false
        getQuestionsForRound()
        displayQuestion()
        timerLabel.hidden = true
    }
    
    // display questions from GameLogic
    func displayQuestion() {
        
        hideAllButtons()
        
        firstButton.hidden = false
        secondButton.hidden = false
        thirdButton.hidden = false
        fourthButton.hidden = false
        
        let currentQuestion = roundQuestions[questionsAsked]
        
        // Assigning options of questions to buttons
        questionField.text = currentQuestion.question
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
    }
    
    // Hiding everything but Play Again button and Text field
    func displayScore() {
        // Hide the answer buttons
        hideAllButtons()
        
        // Display play again button
        playAgainButton.hidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
    }
    
    @IBAction func checkAnswer(sender: UIButton) {
        // Increment the questions asked counter
        let selectedQuestionDict = roundQuestions[questionsAsked]
        let correctAnswer = selectedQuestionDict.answer
        
        disableButtons()
        
        nextQuestion.hidden = false
        normalRoundBtn.hidden = true
        lightningRoundBtn.hidden = true
        
        questionsAsked += 1
        
        // Checks to see if lightning round is active, if it is - stop timer
        if lightningActive {
            timer.invalidate()
        }
        
        // Adding green color to correct answer
        if firstButton.titleLabel?.text == correctAnswer {
            firstButton.backgroundColor = correctAnswerColor
        } else if secondButton.titleLabel?.text == correctAnswer {
            secondButton.backgroundColor = correctAnswerColor
        } else if thirdButton.titleLabel?.text == correctAnswer {
            thirdButton.backgroundColor = correctAnswerColor
        } else {
            fourthButton.backgroundColor = correctAnswerColor
        }
        
        // Prints wrong or right answer text
        if sender.titleLabel!.text == correctAnswer {
            correctQuestions += 1
            questionField.text = "Boom Shakalaka! You are correct!"
            playCorrectAnswerSound()
            checkRound()
        } else {
            questionField.text = "Oh noooo! You were wrong!"
            playWrongAnswerSound()
            checkRound()
        }
    }
    
    // Check to see if game is over. Then display score
    func checkRound() {
        if questionsAsked == questionsPerRound {
            if correctQuestions >= 7 {
                overSevenCorrectSoundWithDelay(seconds: 1.0)
            } else {
                underSevenCorrectSoundWithDelay(seconds: 1.0)
            }
            // Game is over
            displayScore()
        }
    }
    
    func hideAllButtons() {
        firstButton.hidden = true
        secondButton.hidden = true
        thirdButton.hidden = true
        fourthButton.hidden = true
        normalRoundBtn.hidden = true
        lightningRoundBtn.hidden = true
        nextQuestion.hidden = true
        playAgainButton.hidden = true
    }
    
    // Puts buttons into original state
    func resetButtons() {
        firstButton.backgroundColor = defaultColor
        secondButton.backgroundColor = defaultColor
        thirdButton.backgroundColor = defaultColor
        fourthButton.backgroundColor = defaultColor
        
        firstButton.enabled = true
        secondButton.enabled = true
        thirdButton.enabled = true
        fourthButton.enabled = true
    }
    
    func disableButtons() {
        firstButton.enabled = false
        secondButton.enabled = false
        thirdButton.enabled = false
        fourthButton.enabled = false
    }
    
    @IBAction func nextQuestionTapped(sender: AnyObject) {
        
        if lightningActive {
            setupLightningRound()
            subtractTime()
        }
        
        displayQuestion()
        resetButtons()
    }
    
    @IBAction func playAgain() {
        questionsAsked = 0
        correctQuestions = 0
        resetButtons()
        showMenu()
    }
    
    @IBAction func lightningRoundStart(sender: UIButton) {
        
        normalRoundBtn.hidden = true
        lightningRoundBtn.hidden = true
        
        startGame()
        
        timerLabel.hidden = false
        
        setupLightningRound()
        subtractTime()
        lightningActive = true
    }
    
    // MARK: Helper Methods to lightningRoundStart
    
    var seconds = 0.0
    var timer = NSTimer()
    
    func setupLightningRound() {
        timerLabel.textColor = UIColor(red: 225/225, green: 225/225, blue: 225/225, alpha: 1.0)
        seconds = 15.0
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.subtractTime), userInfo: nil, repeats: true)
    }
    
    @objc func subtractTime() {
        seconds -= 0.1
        timerLabel.text = "Time left: \(String(format: "%.01f", seconds))"
        
        if seconds <= 0.0 {
            playWrongAnswerSound()
            timer.invalidate()
            disableButtons()
            nextQuestion.hidden = false
            timerLabel.text = "Time left: 0.0"
            questionsAsked += 1
        } else if seconds < 5 {
            timerLabel.textColor = UIColor(red: 239/255.0, green: 130/255.0, blue: 100/255.0, alpha: 1.0)
            timerLabel.text = "HURRY! \n" + "Time left: \(String(format: "%01f", seconds))"
        }
    }
}