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
    
    // Part 4
    
    // MARK: - Properties
    var thePlayer: SKSpriteNode = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        // Set the actual frame
        //self.anchorPoint = CGPoint(x: 0.5, y: 0)
        
        // Adds the a little drift similiar to wind
        self.physicsWorld.gravity = CGVector(dx: 1, dy: 0)
        
        // Check that the node is not nil
        if let someplayer = self.childNode(withName: "Player") as? SKSpriteNode {
            thePlayer = someplayer
            thePlayer.physicsBody?.isDynamic = true
            thePlayer.physicsBody?.affectedByGravity = false
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
    }
    
    //================
    // MARK: - Methods
    //================
    
    func moveDown() {
        
        // Let the player be affected by gravity for a "wind" affect
        thePlayer.physicsBody?.isDynamic = true
        thePlayer.physicsBody?.affectedByGravity = true

        // Creat the move action - maybe add a group tp add a delay
        let wait = SKAction.wait(forDuration: 0.05)
        let walkAnimation = SKAction(named: "WalkFront")!
        let moveAction = SKAction.moveBy(x: 0, y: -100, duration: 1)
        let group = SKAction.group([walkAnimation, moveAction])
        let finish = SKAction.run {
            // After the player is done walking, make him not affected by "wind" wile he stands
            self.thePlayer.physicsBody?.isDynamic = false
            self.thePlayer.physicsBody?.affectedByGravity = false
        }

        // Group all the actions together
        let sequence = SKAction.sequence([wait, group, finish])

        // Apply the action to the player
        thePlayer.run(sequence)
        
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
