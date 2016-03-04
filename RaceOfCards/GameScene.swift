//
//  GameScene.swift
//  RaceOfCards
//
//  Created by Chris Archibald on 3/3/16.
//  Copyright (c) 2016 Chris Archibald. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    // Variables
    var suits = ["spade", "heart", "diamond", "club"]
    var deck = [Card]()
    
    // Center Card
    var centerCard: SKSpriteNode = SKSpriteNode()
    
    // Player Labels
    var player1Label = SKLabelNode()
    var player2Label = SKLabelNode()
    var player3Label = SKLabelNode()
    var player4Label = SKLabelNode()
    
    // Player Score Labels
    var player1ScoreLabel = SKLabelNode()
    var player2ScoreLabel = SKLabelNode()
    var player3ScoreLabel = SKLabelNode()
    var player4ScoreLabel = SKLabelNode()
    
    // Player Playing Cards and Position
    var player1Cards = [Card]()
    var player1CardPositions = [CGPoint]()
    var player1PlayingPosition = CGPoint()
    var player1PlayingCard = [Card]()
    
    var player2Cards = [Card]()
    var player2CardPositions = [CGPoint]()
    var player2PlayingPosition = CGPoint()
    var player2PlayingCard = [Card]()
    
    var player3Cards = [Card]()
    var player3CardPositions = [CGPoint]()
    var player3PlayingPosition = CGPoint()
    var player3PlayingCard = [Card]()

    var player4Cards = [Card]()
    var player4CardPositions = [CGPoint]()
    var player4PlayingPosition = CGPoint()
    var player4PlayingCard = [Card]()
    
    var currentMovedCards = [Card]()
    var currentPlayer: Int = 0
    var gameInProgress: Bool = false
    
    //player Score Variables
    var player1Score: Int = 0
    var player2Score: Int = 0
    var player3Score: Int = 0
    var player4Score: Int = 0
    
    // Card Positioning Variables
    let cardOffset: CGFloat = 35
    let sides: CGFloat = 60
    
    //Action for Player Labels
    let flashAndScaleAction: SKAction = SKAction.repeatActionForever(SKAction(named: "flashAndScale")!)
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        // Center Card
        centerCard = childNodeWithName("centerCard") as! SKSpriteNode
        
        //Label Nodes
        player1Label = childNodeWithName("player1Label") as! SKLabelNode
        player2Label = childNodeWithName("player2Label") as! SKLabelNode
        player3Label = childNodeWithName("player3Label") as! SKLabelNode
        player4Label = childNodeWithName("player4Label") as! SKLabelNode
        
        player1ScoreLabel = childNodeWithName("player1ScoreLabel") as! SKLabelNode
        player2ScoreLabel = childNodeWithName("player2ScoreLabel") as! SKLabelNode
        player3ScoreLabel = childNodeWithName("player3ScoreLabel") as! SKLabelNode
        player4ScoreLabel = childNodeWithName("player4ScoreLabel") as! SKLabelNode
        
        // Populate the Deck
        for i in 0...suits.count-1 {
            for j in 1...13 {
                if j == 1 {
                    let card: Card = Card(rank: 14, suit: suits[i])
                    deck.append(card)
                } else {
                    let card: Card = Card(rank: j, suit: suits[i])
                    deck.append(card)
                }
            }
        }
        
        setPlayerPlayingPositions()
    }
    
    func populatePlayerCardsAndMoveToCenter(player: Int, idx: Int, inout playerCards: [Card], inout cardPositions: [CGPoint]){
        playerCards.append(self.deck[idx])
        let removedCard = self.deck.removeAtIndex(idx)
        
        removedCard.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(removedCard)
        
        var newX: CGFloat = 0
        var newY: CGFloat = 0
        if player == 1 {
            newX = (self.size.width - (self.cardOffset * 12 + removedCard.size.width)) / 2 + removedCard.size.width/2 + CGFloat(playerCards.count - 1 ) * self.cardOffset
            newY = removedCard.size.height / 2 + self.sides
        } else if player == 2 {
            newX = removedCard.size.width / 2 + self.sides
            let cardsHeights = self.cardOffset * 12 + removedCard.size.height
            let bottomEdge = (self.size.height - cardsHeights) / 2
            let topEdge = self.size.height - bottomEdge
            newY = topEdge - removedCard.size.height / 2 - CGFloat(playerCards.count - 1) * self.cardOffset
        } else if player == 3 {
            newX = (self.size.width - (self.cardOffset * 12 + removedCard.size.width)) / 2 + removedCard.size.width/2 + CGFloat(playerCards.count - 1) * self.cardOffset
            newY = self.size.height - removedCard.size.height / 2 - self.sides
        } else if player == 4 {
            newX = self.size.width - removedCard.size.width / 2 - self.sides
            let cardsHeights = self.cardOffset * 12 + removedCard.size.height
            let bottomEdge = (self.size.height - cardsHeights) / 2
            let topEdge = self.size.height - bottomEdge
            newY = topEdge - removedCard.size.height / 2 - CGFloat(playerCards.count - 1) * self.cardOffset
        }
        cardPositions.append(CGPoint(x: newX, y: newY))
        
        let move = SKAction.moveTo(CGPointMake(newX, newY), duration: 1.0)
        removedCard.runAction(move)
        
        
    }
    
    func setPlayerPlayingPositions() {
        var newX: CGFloat = 0
        var newY: CGFloat = 0
        
        //player 1 
        newX = centerCard.position.x
        newY = centerCard.position.y - centerCard.size.height - cardOffset
        player1PlayingPosition = CGPoint(x: newX, y: newY)
        
        //player 2
        newX = centerCard.position.x - centerCard.size.width - cardOffset
        newY = centerCard.position.y
        player2PlayingPosition = CGPoint(x: newX, y: newY)
        
        //player 3
        newX = centerCard.position.x
        newY = centerCard.position.y + centerCard.size.height + cardOffset
        player3PlayingPosition = CGPoint(x: newX, y: newY)
        
        //player 4
        newX = centerCard.position.x + centerCard.size.width + cardOffset
        newY = centerCard.position.y
        player4PlayingPosition = CGPoint(x: newX, y: newY)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
