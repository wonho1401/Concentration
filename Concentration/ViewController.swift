//
//  ViewController.swift
//  Concentration/Users/jeong-wonho/Documents/swiftEx/Concentration/Concentration/Base.lproj/Main.storyboard
//
//  Created by 정원호 on 2021/09/29.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int{
        return (cardButtons.count + 1) / 2
    }
    // lazy는 초기화 됐다고 간주한다. -> lazy 사용 시 didSet 선언 불가.
    private(set) var flipCount: Int = 0 {
        didSet{
           updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel(){
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: UIColor.systemOrange
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }
    
    //IBOutlet, IBAction은 웬만하면 private으로 설정. -> 뷰 컨트롤러가 UI를 제어하는 방식
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet{
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else{
            print("Chosen card was not in cardButtons.")
        }
        
    }
    
    private func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            } else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? UIColor(red: 0, green: 0, blue: 0, alpha: 0) : UIColor.systemOrange
            }
        }
    }
    
    private var emojiChoices = ["☠️","🦇","🎃","👻","🥶","🍭","💀","🍬","😇"]
    
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0{
            emoji[card] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emoji[card] ?? "?"
    }
}

extension Int {
    var arc4random: Int{
        if self > 0{
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else{
            return 0
        }
    }
}
