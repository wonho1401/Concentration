//
//  Concentration.swift
//  Concentration
//
//  Created by 정원호 on 2021/10/05.
//

import Foundation

//Model

//protocol은 API에서 원하는 것을 불러오는 방식 => 그걸 받는 메소드는 무엇을 원하는 지 나타낼 수 있음
// => protocol이 변수와 함수의 리스트이기 때문에 가능
// protocol은 API를 더 유연하고 이해하기 쉽게 만들어 주는 역할
// protocol도 그저 하나의 타입.

struct Concentration{
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get{
            return cards.indices.filter{ cards[$0].isFaceUp}.oneAndOnly
        }
        
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard(at:\(index)): Chosen card is not in the cards.")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index]{
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


extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
