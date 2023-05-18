import UIKit

var title = "#7DaysOfCode - Estruturas de Dados 7/7: Árvores\n"

print(title)

class Product {
    var id: Int
    var name: String
    var quantity: Int

    init(id: Int, name: String, quantity: Int) {
        self.id = id
        self.name = name
        self.quantity = quantity
    }
}

class Node {
    var product: Product
    var leftProduct: Node?
    var rightProduct: Node?

    init(product: Product) {
        self.product = product
        leftProduct = nil
        rightProduct = nil
    }
}

class ProductTree {
    var root: Node?

    func add(product: Product) {
        let newNode = Node(product: product)

        if root == nil {
            root = newNode
        } else {
            var currentNode: Node? = root
            while true {
                if let node = currentNode, product.id < node.product.id {
                    if node.leftProduct === nil {
                        node.leftProduct = Node(product: product)
                        break
                    } else {
                        currentNode = node.leftProduct
                    }
                } else if let node = currentNode, product.id == node.product.id {
                    currentNode?.product = product
                    break

                } else if let node = currentNode {
                    if node.rightProduct === nil {
                        node.rightProduct = Node(product: product)
                        break
                    } else {
                        currentNode = node.rightProduct
                    }
                }
            }
        }
    }

    func search(id: Int) -> Node? {
        var currentNode: Node? = root

        while currentNode !== nil {
            if let node = currentNode, id < node.product.id {
                currentNode = node.leftProduct
            } else if let node = currentNode, id > node.product.id {
                currentNode = node.rightProduct
            } else {
                return currentNode
            }
        }
        return nil
    }

    func postOrder(node: Node?) {
        if let node = node {
            postOrder(node: node.leftProduct)
            postOrder(node: node.rightProduct)
            print("id: \(node.product.id), nome: \(node.product.name), quantity: \(node.product.quantity)")
        }
    }
}

// Adiciona produtos
var product1 = Product(id: 10, name: "Café", quantity: 34)
var product2 = Product(id: 9, name: "Leite", quantity: 30)
var product3 = Product(id: 12, name: "Arroz", quantity: 67)
var product4 = Product(id: 11, name: "Feijão", quantity: 102)
var product5 = Product(id: 6, name: "Macarrão", quantity: 30)
var product6 = Product(id: 88, name: "Agua", quantity: 14)

// cria a arvore
var productTree = ProductTree()
productTree.add(product: product1)
productTree.add(product: product2)
productTree.add(product: product3)
productTree.add(product: product4)
productTree.add(product: product5)
productTree.add(product: product6)

// buscar um produto
print(productTree.search(id: 6)?.product.id)
print(productTree.search(id: 63)?.product.id)

// atualiza um produto
var product5Atualizado = Product(id: 6, name: "Macarrão", quantity: 99)
productTree.add(product: product5Atualizado)

print("\npós-ordem:")
productTree.postOrder(node: productTree.root)
