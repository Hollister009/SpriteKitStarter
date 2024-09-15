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
    private var isDraggingSquare = false
    
    override func didMove(to view: SKView) {
        configScene()
        createGround()
        createSquare()
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
        if let square = square {
            square.position = CGPoint(x: 0, y: 0)
        }
        
        if let ground = ground {
            ground.size = CGSize(width: size.width * 2, height: 30)
            ground.position = CGPoint(x: 0, y: -(size.height / 2) + (ground.size.height / 2))
            
            // Update the physics body for the ground after changing its size
            ground.physicsBody = SKPhysicsBody(rectangleOf: ground.size)
            ground.physicsBody?.isDynamic = false
        }
    }
    
    private func createGround(){
        ground = SKSpriteNode(color: SKColor.green, size: CGSize(width: size.width, height: 30))
        ground.position = CGPoint(x: 0, y: -(size.height / 2) + (ground.size.height / 2)) // Place at bottom
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
    
    private func touchDown(atPoint pos: CGPoint) {
        if square.contains(pos) {
            // Start dragging the square
            isDraggingSquare = true
            square.physicsBody?.isDynamic = false // Disable physics while dragging
        }
    }

    private func touchMoved(toPoint pos: CGPoint) {
        if isDraggingSquare {
            // Move the square along with the touch
            square.position = pos
        }
    }

    private func touchUp(atPoint pos: CGPoint) {
        if isDraggingSquare {
            // End dragging and re-enable physics
            square.physicsBody?.isDynamic = true // Re-enable physics after release
            isDraggingSquare = false
        }
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
