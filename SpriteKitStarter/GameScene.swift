//
//  GameScene.swift
//  SpriteKitStarter
//
//  Created by Andrii Zhukevych on 15.09.2024.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var square: SKSpriteNode!
    private var ground: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        configScene()
        recalculateLayout()
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        super.didChangeSize(oldSize)
        print(oldSize)
        
        // Recalculate positions and layout based on the new size
        recalculateLayout()
    }
    
    // MARK: - Private Methods
    
    private func configScene() {
        backgroundColor = SKColor.white
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -9.8) // Default gravity
    }
    
    private func recalculateLayout() {
        removeAllChildren()
        // Recreate the scene objects
        createGround()
        createSquare()
    }
    
    
    private func createGround(){
        ground = SKSpriteNode(color: SKColor.green, size: CGSize(width: size.width * 2, height: 50))
        ground.position = CGPoint(x: -(size.width / 2), y: -(size.height / 2)) // Place at bottom
        ground.physicsBody = SKPhysicsBody(rectangleOf: ground.size) // Static physics body
        ground.physicsBody?.isDynamic = false // Ground will not move
        addChild(ground)
    }
    
    private func createSquare() {
        square = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 100, height: 100))
        square.position = CGPoint(x: 0, y: 0) // Place at center
        square.physicsBody = SKPhysicsBody(rectangleOf: square.size) // Enable physics
        square.physicsBody?.isDynamic = true // Make it dynamic
        addChild(square)
    }
    
    // MARK: - Touch Events
    
    private func touchDown(atPoint pos : CGPoint) {
        // Not implemented!
    }
    
    private func touchMoved(toPoint pos : CGPoint) {
        // Not implemented!
    }
    
    private func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    // MARK: - Update Cycle
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
