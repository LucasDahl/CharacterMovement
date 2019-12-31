//
//  GameScene.swift
//  CharacterMovement
//
//  Created by Lucas Dahl on 12/30/19.
//  Copyright © 2019 Lucas Dahl. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // 
    
    // MARK: - Properties
    var thePlayer: SKSpriteNode = SKSpriteNode()
    
    
    override func didMove(to view: SKView) {
        
        // Set the actual frame
        //self.anchorPoint = CGPoint(x: 0.5, y: 0)
        
        // Check that the node is not nil
        if let someplayer = self.childNode(withName: "Player") as? SKSpriteNode {
            thePlayer = someplayer
            thePlayer.physicsBody?.isDynamic = true
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
    }
    
    //================
    // MARK: - Methods
    //================
    
    func moveDown() {
        
        // Creat the move action
        let moveAction = SKAction.moveBy(x: 0, y: -100, duration: 1)
        
        // Apply the action to the player
        thePlayer.run(moveAction)
        
    }
    
    //===============
    //MARK: - Touches
    //===============
    
    func touchDown(atPoint pos : CGPoint) {
        
        if pos.y > 0 {
            
            // Top half
            
        } else {
            
            // Bottom hlaf
            moveDown()
            
        }
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            self.touchDown(atPoint: t.location(in: self))
            break
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchMoved(toPoint: t.location(in: self))
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchUp(atPoint: t.location(in: self))
            
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchUp(atPoint: t.location(in: self))
            
        }
    }
    
    
}
