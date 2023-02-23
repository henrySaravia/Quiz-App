//
//  Question.swift
//  Quizzler
//
//  Created by henry saravia on 23/2/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation


class Question {
    let question: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        question = text
        answer = correctAnswer
    }
}
