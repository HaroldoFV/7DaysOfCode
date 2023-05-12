import UIKit

var title = "#7DaysOfCode - Estruturas de Dados 1/7: Arrays\n"

print(title)

class ListaDeCompras {
    private var itens: [String] = []
    private var quantidades: [Int] = []

    func adicionarItem(nomeProduto: String, quantidade: Int) {
        if nomeProduto.isEmpty {
            print("nome do produto informado para cadastro está vazio. Informe um nome válido.")
        } else if quantidade <= 0 {
            print("quantidade deve ser maior que zero.")
        } else {
            itens.append(nomeProduto)
            quantidades.append(quantidade)
        }
    }

    func removerItem(nomeProduto: String) {
        if let idxProd = itens.firstIndex(of: nomeProduto) {
            itens.remove(at: idxProd)
            if let idxQuant = quantidades.firstIndex(of: quantidades[idxProd]) {
                quantidades.remove(at: idxQuant)
            }
        } else {
            print("\no item: \(nomeProduto) informado para remoção não foi encontrado.\n")
        }
    }

    func listarItens() {
        print("\nLista de Itens:")
        for item in 0 ..< itens.count {
            print("Produto: \(itens[item]), quantidade: \(quantidades[item])")
        }
    }
}

var listaDeCompras = ListaDeCompras()
listaDeCompras.adicionarItem(nomeProduto: "café", quantidade: 10)
listaDeCompras.adicionarItem(nomeProduto: "leite", quantidade: 5)
listaDeCompras.adicionarItem(nomeProduto: "arroz", quantidade: 3)

// exibindo
listaDeCompras.listarItens()

// removendo um item
listaDeCompras.removerItem(nomeProduto: "leite")

// exibindo
listaDeCompras.listarItens()
