//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        guard let playersCards = hand else {
            return false
        }
        for tossCard in playersCards {
            if tossCard.value == card.value {
                return true
            }
        }
        return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        guard let playersCards = hand else {
            return false
        }
        for tossCard in playersCards {
            for tableCard in table {
                if tossCard.value == tableCard.key.value || tossCard.value == tableCard.value.value {
                    return true
                }
            }
        }
        return false
    }
}
