import Foundation

struct CardDeck {
    private var cards = [Card]()
    
    init() {
        cards = CardBox.takeSetOfCards()
        cards = cards.shuffled()
    }
    
    public var count: Int {
        return cards.count
    }
    
    public mutating func shuffle() {
        cards = cards.customShuffled()
    }
    
    public mutating func removeOne() -> Card? {
        guard let card = cards.popLast() else { return nil }
        return card
    }
    
    public mutating func reset() {
        cards = CardBox.takeSetOfCards()
    }
}

extension Array {
    mutating func customShuffled() -> [Element] {
        var shuffledElements = self
        for index in 0..<shuffledElements.count {
            let randomIndex = Int.random(in: index..<shuffledElements.count)
            
            let temp = shuffledElements[index]
            shuffledElements[index] = shuffledElements[randomIndex]
            shuffledElements[randomIndex] = temp
        }
        return shuffledElements
    }
}
