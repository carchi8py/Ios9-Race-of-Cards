//
//  Card.swift
//  RaceOfCards
//
//  Created by Chris Archibald on 3/3/16.
//  Copyright © 2016 Chris Archibald. All rights reserved.
//

import UIKit
import SpriteKit

class Card: SKSpriteNode {
    
    var rank: Int
    var suit: String
    var imageNameUp: String
    
    init(rank: Int, suit: String) {
        self.rank = rank
        self.suit = suit
        self.imageNameUp = "\(suit)_\(rank)"
        let cardTexture = SKTexture(imageNamed: imageNameUp)
        
        super.init(texture: cardTexture, color: UIColor.blackColor(), size: cardTexture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
