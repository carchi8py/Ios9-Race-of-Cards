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
    var desk = [Card]()
    
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
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
