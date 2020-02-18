//
//  Players.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/17.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Players {
    enum Number: Int {
        case two = 2
        case three = 3
        case four = 4

        func invokePerPlayerCount<T>(_ block: () -> T) -> [T] {
            return (0..<rawValue).map { _ in block() }
        }
    }
    
    private let players: [Participant]
    
    var count: Int {
        return players.count
    }
    
    init(with number: Number) {
        self.players = number.invokePerPlayerCount { Participant() }
    }
    
    @discardableResult
    func repeatForEachPlayer<T>(_ transform: (Participant) -> T) -> [T] {
        return players.map { transform($0) }
    }
}
