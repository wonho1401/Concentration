//
//  Concentration.swift
//  Concentration
//
//  Created by 정원호 on 2021/10/05.
//

import Foundation

//Model

class Concentration{
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get{
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUp{
                    if foundIndex == nil{
                        foundIndex = index
                    } else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard(at:\(index)): Chosen card is not in the cards.")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else{
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): You must have at least one pair of cards.")
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}
