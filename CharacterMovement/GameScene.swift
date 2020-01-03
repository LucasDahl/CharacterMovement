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
    
    
    
    // MARK: - Properties
    var thePlayer: SKSpriteNode = SKSpriteNode()
    var movementSpeed: TimeInterval = 1
    let swipeRightRec = UISwipeGestureRecognizer()
    let swipeLeftRec = UISwipeGestureRecognizer()
    let rotateRec = UIRotationGestureRecognizer()
    let tapRec = UITapGestureRecognizer()
    
    override func didMove(to view: SKView) {
        
        // Set the actual frame
        //self.anchorPoint = CGPoint(x: 0.5, y: 0)
        
        // Adds the a little drift similiar to wind
        self.physicsWorld.gravity = CGVector(dx: 1, dy: 0)
        
        // Rotation Gestures
        rotateRec.addTarget(self, action: #selector(GameScene.rotatedView(_:)))
        self.view?.addGestureRecognizer(rotateRec)
        
        // Tap Gestures
        tapRec.addTarget(self, action: #selector(GameScene.tappedView))
        tapRec.numberOfTouchesRequired = 1
        tapRec.numberOfTapsRequired = 1
        self.view?.addGestureRecognizer(tapRec)
        
        // Swipe Gestures
        swipeRightRec.addTarget(self, action: #selector(GameScene.swipedRight))
        swipeRightRec.direction = .right
        self.view?.addGestureRecognizer(swipeRightRec)
        
        swipeLeftRec.addTarget(self, action: #selector(GameScene.swipedLeft))
        swipeLeftRec.direction = .left
        self.view?.addGestureRecognizer(swipeLeftRec)
        
        // Check that the node for the player is not nil
        if let someplayer = self.childNode(withName: "Player") as? SKSpriteNode {
            thePlayer = someplayer
            thePlayer.physicsBody?.isDynamic = true
            thePlayer.physicsBody?.affectedByGravity = false
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
    }
    
    //==================
    // MARK: - Selectors
    //==================
    
    @objc func swipedRight() {
        
    }
    
    @objc func swipedLeft() {
        
    }
    
    @objc func rotatedView(_ sender:UIRotationGestureRecognizer) {
        
        if sender.state == .began {
            
        }
        
        
    }
    
    @objc func tappedView() {
        
    }
    
    //================
    // MARK: - Methods
    //================
    
    func cleanUp() {
        
        // removes the gestures when presenting a different scene class
        for gesture in self.view!.gestureRecognizers! {
            self.view?.removeGestureRecognizer(gesture)
        }
        
    }
    
    func moveDown() {
        
        // Let the player be affected by gravity for a "wind" affect
        thePlayer.physicsBody?.isDynamic = true
        thePlayer.physicsBody?.affectedByGravity = true

        // Creat the move action - maybe add a group tp add a delay
        let wait = SKAction.wait(forDuration: 0.05)
        let walkAnimation = SKAction(named: "WalkFront")!
        let moveAction = SKAction.moveBy(x: 0, y: -100, duration: movementSpeed)
        let group = SKAction.group([walkAnimation, moveAction])
        let finish = SKAction.run {
            // After the player is done walking, make him not affected by "wind" wile he stands
            self.thePlayer.physicsBody?.isDynamic = false
            self.thePlayer.physicsBody?.affectedByGravity = false
        }

        // Note run will run all code simultaneously and sequence will run the code in sequence
        
        // Group all the actions together
        let sequence = SKAction.sequence([wait, group, finish])

        // Apply the action to the player
        thePlayer.run(sequence)
        
    }
    
    //===============
    //MARK: - Touches
    //===============
    
    func touchDown(atPoint pos : CGPoint) {
        
        /*
        if pos.y > 0 {
            
            // Top half
            
        } else {
            
            // Bottom hlaf
            moveDown()
            
        }
        */
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
