//
//  ViewController.swift
//  psychologicalTest
//
//  Created by user on 19/12/22.
//

import UIKit

class QnaViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerBtn: [UIButton]!
    
    var questions = [Qna]()
    var questionIndex = 0
    var totalscore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let question1 = Qna(description: "1.一般來說，你心情最好的時候是？", option: ["早上 +5","下午 +10","晚上 +15"])
        questions.append(question1)
        let question2 = Qna(description: "2.坐著休息時，你的坐姿？", option: ["曲起一隻腿、另一隻腿伸直 +5","維持坐著，將雙腿伸直 +10","翹腳 +15"])
        questions.append(question2)
        let question3 = Qna(description: "3.遇到很好笑的事情，你會？", option: ["害羞的微笑 +5","會笑，但不會太大聲 +10","毫不隱藏的大笑 +15"])
        questions.append(question3)
        let question4 = Qna(description: "4.在派對或是人多的場合時，你會？", option: ["儘量不引別人注意，安靜低調 +5","周圍找有沒有認識的人避免尷尬 +10","打扮華麗、引人注目 +15"])
        questions.append(question4)
        let question5 = Qna(description: "5.集中於一件事情、卻突然被妨礙時，你會？", option: ["介於之間 +5","感到非常煩燥 +10","認為剛好獲得休息的機會 +15"])
        questions.append(question5)
       
        startGame()
    }
    
    func startGame() {
        
        if questionIndex < 5{
        questionLabel.text = questions[questionIndex].description
        //填入選項內容
        for i in 0...2{
            answerBtn[i].setTitle(questions[questionIndex].option[i], for: .normal)
        }
        }
    }
    
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        questionIndex += 1
        startGame()
        
        //先將btn都設定好tag，其tag就是各自選項代表的分數
        if questionIndex < 6 {
            totalscore += sender.tag
        }
        
        //判斷是否還有題目
        //當題目數為五題時，傳遞資料
        if questionIndex == 5 {
        performSegue(withIdentifier: "show", sender: nil)
        }
        
    }
    
    
    @IBSegueAction func showResult(_ coder: NSCoder) -> ResultViewController? {
        return ResultViewController(coder: coder,score:totalscore)
    }
}

