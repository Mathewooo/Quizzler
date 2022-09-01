import Foundation

struct Question {
    let question: String
    let choices: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        question = q
        choices = a
        self.correctAnswer = correctAnswer
    }
}
