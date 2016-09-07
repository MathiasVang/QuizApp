//
//  AllGameSound.swift
//  TrueFalseStarter
//
//  Created by Mathias Vang Rasmussen on 07/09/2016.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation
import AudioToolbox


// All sounds loads first and is put into viewDidLoad()
// Then we can call them when appropriate
// MARK: Helper Methods

func overSevenCorrectSoundWithDelay(seconds seconds: Double) {
    // Converts a delay in seconds to nanoseconds as signed 64 bit integer
    let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
    // Calculates a time value to execute the method given current time and delay
    let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
    
    // Executes the playerOverSevenCorrectQuestionsSoud method at the dispatch time on the main queue
    dispatch_after(dispatchTime, dispatch_get_main_queue()) {
        playOverSevenCorrectQuestionsSound()
    }
}

func underSevenCorrectSoundWithDelay(seconds seconds: Double) {
    // Converts a delay in seconds to nanoseconds as signed 64 bit integer
    let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
    // Calculates a time value to execute the method given current time and delay
    let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
    
    // Executes the playUnderSevenCorrectQuestionsSound method at the dispatch time on the main queue
    dispatch_after(dispatchTime, dispatch_get_main_queue()) {
        playUnderSevenCorrectQuestionsSound()
    }
}

var gameSound: SystemSoundID = 0

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
    let pathToSoundFile = NSBundle.mainBundle().pathForResource("got_s1e4_hodor", ofType: "wav")
    let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL, &correctSound)
}

func playCorrectAnswerSound() {
    AudioServicesPlaySystemSound(correctSound)
}

var wrongSound: SystemSoundID = 0

func loadWrongAnswerSound() {
    let pathToSoundFile = NSBundle.mainBundle().pathForResource("got_s1e2_false", ofType: "wav")
    let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL, &wrongSound)
}

func playWrongAnswerSound() {
    AudioServicesPlaySystemSound(wrongSound)
}

var overSevenCorrectQuestionsSound: SystemSoundID = 0

func loadOverSevenCorrectQuestionsSound() {
    let pathToSoundFile = NSBundle.mainBundle().pathForResource("got_s2e1_power1", ofType: "wav")
    let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL, &overSevenCorrectQuestionsSound)
}

func playOverSevenCorrectQuestionsSound() {
    AudioServicesPlaySystemSound(overSevenCorrectQuestionsSound)
}

var underSevenCorrectQuestionsSound: SystemSoundID = 0

func loadUnderSevenCorrectQuestionSound() {
    let pathToSoundFile = NSBundle.mainBundle().pathForResource("got_s1e4_yield_emphatically", ofType: "wav")
    let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL, &underSevenCorrectQuestionsSound)
}

func playUnderSevenCorrectQuestionsSound() {
    AudioServicesPlaySystemSound(underSevenCorrectQuestionsSound)
}
