//
//  Card.swift
//  Concentration
//
//  Created by 정원호 on 2021/10/05.
//

import Foundation

struct Card: Hashable{
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
