import UIKit

class Fruit {
    func isWithingRange(_ position: Int, _ s: Int, _ t: Int, _ offset: Int) -> Bool {
        return (position + offset) >= s && (position + offset) <= t
    }

    static func countFruits(in fruits: [Fruit], from s: Int, to t: Int, withOffset offset: Int) -> Int {
        return fruits.enumerated().reduce(0, {
            return $1.element.isWithingRange($1.offset, s, t, offset) ? $0 + 1 : $0
        })
    }
}

class Orange: Fruit {}
class Apple: Fruit {}

let fruits = [Orange(), Apple(), Orange(), Apple(), Apple(), Orange(), Orange()]
Fruit.countFruits(in: fruits, from: 2, to: 4, withOffset: 3)
