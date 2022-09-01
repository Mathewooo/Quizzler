import Foundation
import UIKit

struct QuizCore {
    let quiz: [Question] = [
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    var questionNumber: Int = 0
    var score: Int = 0
    
    mutating func checkAnswer(userAnswer: String) -> UIColor {
        let actualAnswer: String = quiz[questionNumber].correctAnswer
        if userAnswer == actualAnswer {
            if !isEqual() {
                score += 1
            }
            return UIColor.green
        } else {
            return UIColor.red
        }
    }
    
    mutating func nextQuestion() {
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
    func isEqual() -> Bool {
        return questionNumber == quiz.count - 1
    }
    
    func getQuestion() -> String {
        quiz[questionNumber].question
    }
    
    func getChoice(c: Int) -> String {
        quiz[questionNumber].choices[c]
    }
    
    func getProgress() -> Float {
        Float(questionNumber + 1) / Float(quiz.count)
    }
    
    func getScore() -> Int {
        score
    }
}
