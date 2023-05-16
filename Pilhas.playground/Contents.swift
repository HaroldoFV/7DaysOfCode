import UIKit

var title = "#7DaysOfCode - Estruturas de Dados 5/7: Pilhas\n"

print(title)

class Book {
    var title: String
    var numberPages: Int

    init(title: String, numberPages: Int) {
        self.title = title
        self.numberPages = numberPages
    }
}

class StackOfBooks {
    var list: [Book] = []

    func add(book: Book) {
        list.append(book)
    }

    func remove() -> Book? {
        if !list.isEmpty {
            return list.removeLast()
        }
        return nil
    }

    func peek() -> Book? {
        return list.last
    }

    func print() {
        Swift.print("LIVROS:")
        var i = 0
        while i < list.count {
            Swift.print("título: \(list[i].title), número de páginas: \(list[i].numberPages)")
            i += 1
        }
        Swift.print("")
    }
}

// Cria livros
var book1 = Book(title: "A Guerra dos Tronos", numberPages: 694)
var book2 = Book(title: "A Fúria dos Reis", numberPages: 768)
var book3 = Book(title: "A Tormenta de Espadas", numberPages: 973)
var book4 = Book(title: "O Festim dos Corvos", numberPages: 753)
var book5 = Book(title: "A Dança dos Dragões", numberPages: 1056)

// Adiciona livros na pilha
var stackOfBooks = StackOfBooks()
stackOfBooks.add(book: book1)
stackOfBooks.add(book: book2)
stackOfBooks.add(book: book3)
stackOfBooks.add(book: book4)
stackOfBooks.add(book: book5)

// Exibe livros
stackOfBooks.print()

// Exibe o ultimo livro
print("\núltimo livro: \(stackOfBooks.peek()?.title ?? ""), número de páginas: \(stackOfBooks.peek()?.numberPages ?? 0) \n")

// Remove livros
stackOfBooks.remove()
stackOfBooks.remove()

// Exibe livros
stackOfBooks.print()

print("\n")
