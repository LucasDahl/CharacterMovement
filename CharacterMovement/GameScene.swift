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
        self.anchorPoint = CGPoint(x: 0.5, y: 0)
        
        // Check that the node is not nil
        if let someplayer = self.childNode(withName: "Player") as? SKSpriteNode {
            thePlayer = someplayer
            thePlayer.physicsBody?.isDynamic = true
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
    }
    
    //===============
    //MARK: - Touches
    //===============
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
}
