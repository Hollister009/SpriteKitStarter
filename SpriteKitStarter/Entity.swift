//
//  Entity.swift
//  SpriteKitStarter
//
//  Created by Andrii Zhukevych on 15.09.2024.
//

import SpriteKit

class Entity {
    var id: UUID
    var components: [Component] = []
    
    init() {
        self.id = UUID() // Unique identifier for each entity
    }
    
    func addComponent(_ component: Component) {
        components.append(component)
    }
    
    func getComponent<T: Component>(ofType componentType: T.Type) -> T? {
        return components.first { $0 is T } as? T
    }
}

protocol Component {
    // Marker protocol for all components
}

struct PositionComponent: Component {
    var x: CGFloat
    var y: CGFloat
}

struct PhysicsComponent: Component {
    var body: SKPhysicsBody
}
