import UIKit

var title = "#7DaysOfCode - Estruturas de Dados 3/7: Lista duplamente encadeada\n"

print(title)

class Product {
    var name: String
    var barCode: String
    var price: Double
    var quantity: Int

    init(name: String, barCode: String, price: Double, quantity: Int) {
        self.name = name
        self.barCode = barCode
        self.price = price
        self.quantity = quantity
    }
}

class Node {
    var product: Product
    var nextProduct: Node?
    var previousProduct: Node?

    init(product: Product) {
        self.product = product
        self.nextProduct = nil
        self.previousProduct = nil
    }
}

class ListProduct {
    var head: Node?
    var tail: Node?

    func add(product: Product) {
        let newNode = Node(product: product)
        if head == nil {
            head = newNode
        } else {
            var currentNode = head
            while currentNode?.nextProduct != nil {
                currentNode = currentNode?.nextProduct
            }
            currentNode?.nextProduct = newNode
            newNode.previousProduct = currentNode
        }
    }

    func remove(product: Product) {
        if head == nil { return }

        if !productAlreadyExists(product: product) {
            Swift.print("\nO produto: \(product.name) informado para remoção não foi encontrado.")
        } else {
            if head?.product === product {
                head = head?.nextProduct
                head?.previousProduct = nil
                return
            }

            var currentNode = head
            var previousNode: Node?

            while currentNode != nil, currentNode?.product !== product {
                previousNode = currentNode
                currentNode = currentNode?.nextProduct
            }

            previousNode?.nextProduct = currentNode?.nextProduct
            currentNode?.previousProduct = nil
        }
    }

    func update(product: Product) {
        var current = head
        while current != nil {
            if current?.product.name == product.name {
                current?.product = product
            }
            current = current?.nextProduct
        }
    }

    func getProduct(product: Product) -> String {
        var current = head
        while current != nil {
            if current?.product === product {
                return
                    String("\nProduto encontrado: \(current?.product.name ?? ""), Código de Barra: \(current?.product.barCode ?? ""), Preço: \(current?.product.price ?? 0), Quantidade: \(current?.product.quantity ?? 0)")
            }
            current = current?.nextProduct
        }
        return String("\nO produto: \(product.name) não foi encontrado.")
    }

    func getByName(name: String) -> [Product?] {
        var result: [Product?] = []
        var actual = head

        while actual != nil {
            if actual?.product.name == name {
                result.append(actual?.product ?? nil)
            }
            actual = actual?.nextProduct
        }
        return result
    }

    func productAlreadyExists(product: Product) -> Bool {
        var current = head
        while current != nil {
            if current?.product === product {
                return true
            }
            current = current?.nextProduct
        }
        return false
    }

    func print() {
        Swift.print("")
        var current = head
        while current != nil {
            let product = current!.product
            Swift.print("Produto: \(product.name), Código de Barra: \(product.barCode), Preço: \(product.price), Quantidade: \(product.quantity)")
            current = current?.nextProduct
        }
    }
}

var product1 = Product(name: "café", barCode: "ASD2983KDKDJ", price: 5.0, quantity: 40)
var product2 = Product(name: "leite", barCode: "LMDJDJH9383", price: 7.0, quantity: 13)
var product3 = Product(name: "feijão", barCode: "393893ASDF", price: 9.0, quantity: 10)
var product4 = Product(name: "açucar", barCode: "ADFASDFAF123", price: 4.2, quantity: 14)
var productTest = Product(name: "test", barCode: "123", price: 4, quantity: 2)

var listProduct = ListProduct()
listProduct.add(product: product1)
listProduct.add(product: product2)
listProduct.add(product: product3)
listProduct.add(product: product4)

listProduct.print()

listProduct.remove(product: product4)

listProduct.print()

// Buscar um produto
var result = listProduct.getProduct(product: product3)
print(result)

var product1Update = Product(name: "leite", barCode: "ASD2983KDKDJB", price: 7.5, quantity: 97)
listProduct.update(product: product1Update)

listProduct.print()

var resultSearch = listProduct.getByName(name: "leite")
print("\nBusca retornou(\(resultSearch.count)):")
for item in resultSearch {
    print("\(item?.name ?? "")")
}
