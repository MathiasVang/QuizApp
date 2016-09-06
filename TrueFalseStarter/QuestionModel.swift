//
//  QuestionModel.swift
//  TrueFalseStarter
//
//  Created by Mathias Vang Rasmussen on 01/09/2016.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation

//Creating the appropriate data model for the questions

struct QuestionModel {
    let question: String
    let option1: String
    let option2: String
    let option3: String?
    let option4: String?
    let answer: String
}

// Creating instances of each question

let question1 = QuestionModel(question: "This was the only US President to serve more than two consecutive terms", option1: "George Washington", option2: "Franklin D. Roosevelt", option3: "Woodrow Wilson", option4: "Andrew Jackson", answer: "Franklin D. Roosevelt")
let question2 = QuestionModel(question: "Which of the following countries has the most residents?", option1: "Nigeria", option2: "Russia", option3: "Iran", option4: "Vietnam", answer: "Nigeria")
let question3 = QuestionModel(question: "In what year was the United Nations founded?", option1: "1918", option2: "1919", option3: "1945", option4: "1954", answer: "1945")
let question4 = QuestionModel(question: "The Titanic departed from the United Kingdo, where was it supposed to arrive?", option1: "Paris", option2: "Washington D.C.", option3: "New York City", option4: "Boston", answer: "New York City")
let question5 = QuestionModel(question: "Which nation produces the most oil?", option1: "Iran", option2: "Iraq", option3: "Brazil", option4: "Canada", answer: "Canada")
let question6 = QuestionModel(question: "Which country has most recently won consecutive World Cups in Soccer?", option1: "Italy", option2: "Brazil", option3: "Argentina", option4: "Spain", answer: "Brazil")
let question7 = QuestionModel(question: "Which of the following rivers is longest?", option1: "Yangtze", option2: "Mississippi", option3: "Congo", option4: "Mekong", answer: "Mississippi")
let question8 = QuestionModel(question: "Which city is the oldest?", option1: "Mexico City", option2: "Cape Town", option3: "San Juan", option4: "Sydney", answer: "Mexico City")
let question9 = QuestionModel(question: "Which country was the first to allow women to vote in national elections?", option1: "Poland", option2: "United States", option3: "Sweden", option4: "Senegal", answer: "Poland")
let question10 = QuestionModel(question: "Which of these countries won the most medals in the 2012 Summer Games?", option1: "France", option2: "Germany", option3: "Japan", option4: "Great Britain", answer: "Great Britain")
let question11 = QuestionModel(question: "Ony female koalas can whistle", option1: "True", option2: "False", option3: nil, option4: nil, answer: "False")
let question12 = QuestionModel(question: "Blue whales are technically whales", option1: "True", option2: "False", option3: nil, option4: nil, answer: "True")
let question13 = QuestionModel(question: "Camels are cannibalistic", option1: "True", option2: "False", option3: nil, option4: nil, answer: "False")
let question14 = QuestionModel(question: "All ducks are birds", option1: "True", option2: "False", option3: nil, option4: nil, answer: "True")


// All questions are put in an array

let allQuestions = [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, question11, question12, question13, question14]



