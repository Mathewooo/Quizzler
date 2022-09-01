import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var secondChoice: UIButton!
    @IBOutlet weak var thirdChoice: UIButton!
    
    lazy var buttonArray: [UIButton] = [
        firstChoice,
        secondChoice,
        thirdChoice
    ]
    
    var quizCore = QuizCore()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        fetchChoicesOnButtons()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer: String? = sender.currentTitle
        if let userAnswer = userAnswer {
            sender.backgroundColor = quizCore.checkAnswer(userAnswer: userAnswer)
        }
        quizCore.nextQuestion()
        fetchChoicesOnButtons()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.updateUI()
        }
    }
    
    func updateUI() {
        for button in buttonArray {
            button.backgroundColor = UIColor.clear
        }
        questionLabel.text = quizCore.getQuestion()
        progressBar.progress = quizCore.getProgress()
        scoreLabel.text = "Score: \(quizCore.getScore())"
    }
    
    func fetchChoicesOnButtons() {
        for (index, button) in buttonArray.enumerated() {
            button.setTitle(quizCore.getChoice(c: index), for: .normal)
        }
    }
}
