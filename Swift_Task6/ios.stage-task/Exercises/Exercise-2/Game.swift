//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        var firstAttackingPlayer = players.first
        var minimalTrump = Value.ace.rawValue
        for player in players {
            if player.hand == nil {
                return nil
            } else {
                for playersCards in player.hand! {
                    if playersCards.isTrump && playersCards.value.rawValue <= minimalTrump {
                        firstAttackingPlayer = player
                        minimalTrump = playersCards.value.rawValue
                    }
                }
            }
        }
        return firstAttackingPlayer
    }
}
