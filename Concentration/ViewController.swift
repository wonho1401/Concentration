//
//  ViewController.swift
//  Concentration/Users/jeong-wonho/Documents/swiftEx/Concentration/Concentration/Base.lproj/Main.storyboard
//
//  Created by 정원호 on 2021/09/29.
//

import UIKit

class ViewController: UIViewController {

    var flipCount: Int = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var emojiChoices = ["🎃","👻","🎃","👻"]
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else{
            print("Chosen card was not in cardButtons.")
        }
        
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji{
            button.setTitle("", for: .normal)
            button.backgroundColor = .orange
        } else{
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
        }
    }

}

