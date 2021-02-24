import Foundation

class Players {
    private var players: [Playable]
    
    init() {
        self.players = [Playable]()
    }
    
    
    public func registerPlayers(numberOfPlayer: NumberOfParticipant, dealer: Playable) {
        players = [Playable]()
        
        for index in 1...numberOfPlayer.rawValue {
            let player = Player(ID: index)
            players.append(player)
        }
        players.append(dealer)
    }
    
    public func resetPlayersCard() {
        players.forEach { (player) in
            player.resetCard()
        }
    }
    
    public func configEachPlayer(config: (Playable) -> ()) {
        for player in players {
            config(player)
        }
    }
    
    public func winnerPlayer() -> Playable {
        let winner = players.reduce(players[0]) { (playerA, playerB) -> Playable in
            if playerA.result < playerB.result {
                return playerB
            } else {
                return playerA
            }
        }
        if let index = players.firstIndex(where: { $0.name == winner.name }) {
            return players[index]
        } else {
            return Player(ID: 0)
        }
    }
}
