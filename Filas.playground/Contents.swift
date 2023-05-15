import UIKit

var title = "#7DaysOfCode - Estruturas de Dados 4/7: 👩🏽‍💻 Filas\n"

print(title)

class Order {
    var number: String
    var nameCustomer: String
    var itens: String
    var total: Double

    init(number: String, nameCustomer: String, itens: String, total: Double) {
        self.number = number
        self.nameCustomer = nameCustomer
        self.itens = itens
        self.total = total
    }
}

class OrderQueue {
    var list: [Order] = []

    func add(order: Order) {
        list.append(order)
    }

    func remove() -> Order? {
        if !list.isEmpty {
            return list.removeFirst()
        }
        return nil
    }

    func print() {
        Swift.print("Clientes:")
        var i = 0
        while i < list.count {
            Swift.print("número: \(list[i].number), Cliente: \(list[i].nameCustomer), itens: \(list[i].itens), total: \(list[i].total)")
            i += 1
        }
        Swift.print("")
    }
}

// Cria pedidos
var order1 = Order(number: "000001", nameCustomer: "Maria Silva", itens: "Agua, Cafe, Pão de queijo", total: 98.90)
var order2 = Order(number: "000002", nameCustomer: "João Cardozo", itens: "Refrigerante, Cafe, lanche pequeno", total: 70.0)
var order3 = Order(number: "000003", nameCustomer: "Silvana Aparecido", itens: "Pão, Cafe, lanche pequeno", total: 40.0)

// Adiciona pedidos na fila
var listOrder = OrderQueue()
listOrder.add(order: order1)
listOrder.add(order: order2)
listOrder.add(order: order3)
listOrder.print()

// Remove pedidos
listOrder.remove()
listOrder.remove()

// Exibe pedidos
listOrder.print()


print("\n")
