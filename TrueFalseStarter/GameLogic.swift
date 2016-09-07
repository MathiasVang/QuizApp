//
//  GameLogic.swift
//  TrueFalseStarter
//
//  Created by Mathias Vang Rasmussen on 01/09/2016.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation

let questionsPerRound = 10
var roundQuestions: [QuestionModel] = []

func getQuestionsForRound() {
    var randomNumberArr: [Int] = []
    while roundQuestions.count < questionsPerRound {
        let randomNumber = Int(arc4random_uniform(UInt32(allQuestions.count)))
        if  !randomNumberArr.contains(randomNumber) {
            randomNumberArr.append(randomNumber)
            roundQuestions.append(allQuestions[randomNumber])
        }
    }
    
    print(roundQuestions.count)
    
}
