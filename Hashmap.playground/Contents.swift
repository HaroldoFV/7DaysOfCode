import UIKit

var title = "#7DaysOfCode - Estruturas de Dados 6/7: 👩🏽‍💻 Hashmap\n"

print(title)

class Game {
    private var players: [String: Int] = [:]

    func add(user: String, points: Int) {
        if players[user] == nil {
            players[user] = points
        } else {
            print("\nErro ao adicionar: Jogador (\(user)) já existe.")
        }
    }

    func update(user: String, points: Int) {
        if let player = players[user] {
            players[user] = points
        } else {
            print("\nErro ao atualizar: Jogador (\(user)) não encontrado.")
        }
    }

    func remove(user: String) {
        if let player = players[user] {
            players.removeValue(forKey: user)
        } else {
            print("\nErro ao remover: Jogador (\(user)) não encontrado.")
        }
    }

    func list() {
        let sortedPlayers = players.sorted(by: { $0.value > $1.value })
        print("\nPontuação:")
        for (user, points) in sortedPlayers {
            print("Player: \(user), Points: \(points)")
        }
    }

    func checkWinner() -> (user: String, points: Int)? {
        var winner: (user: String, points: Int)?

        if !players.isEmpty {
            for (user, points) in players {
                if winner == nil || points > winner?.points ?? 0 {
                    winner = (user, points)
                }
            }
        }
        return winner
    }
}

var game = Game()
game.add(user: "Ronaldo", points: 99)
game.add(user: "Zidane", points: 233)
game.add(user: "Maria", points: 103)
game.add(user: "Tereza", points: 199)

// exibindo
game.list()

// atualizar pontos
game.update(user: "Maria", points: 400)

// removendo um item
game.remove(user: "Zidane")

// exibindo
game.list()

// verificar vencedor
print("\n")
var winner = game.checkWinner()
print("O vencedor é: \(winner?.user ?? "") com \(winner?.points ?? 0) pontos.")
