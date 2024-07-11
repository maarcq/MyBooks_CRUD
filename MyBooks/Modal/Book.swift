
import SwiftUI
import SwiftData

@Model

class Book {
    
    var title: String         // titulo do livro
    var author: String        // autor do livro
    var dateAdded: Date       // data que adicionou livro
    var dateStarted: Date     // data que começou a ler
    var dateCompleted: Date   // data que terminou de ler
    var summary: String       // resumo do livro
    var rating: Int?          // nota do livro (opcional)
    var status: Status        // status da leitura
    
    init(
        title: String,
        author: String,
        dateAdded: Date = Date.now,
        dateStarted: Date = Date.distantPast,
        dateCompleted: Date = Date.distantPast,
        summary: String = "",
        rating: Int? = nil,
        status: Status = .onShelf
    ) {
        self.title = title
        self.author = author
        self.dateAdded = dateAdded
        self.dateStarted = dateStarted
        self.dateCompleted = dateCompleted
        self.summary = summary
        self.rating = rating
        self.status = status
    }
    
    var icon: Image {    // icon para cada status da leitura
        switch status {
        case .onShelf:
            Image(systemName: "checkmark.diamond.fill")
        case .inProgress:
            Image(systemName: "book.fill")
        case .completed:
            Image(systemName: "books.vertical.fill")
        }
    }
}

enum Status: Int, Codable, Identifiable, CaseIterable {
    
    case onShelf, inProgress, completed
    
    var id: Self {
        
        self
        
    }
    var descr: String {
        
        switch self {
            
        case .onShelf:
            "Na prateleira"
        case .inProgress:
            "Lendo"
        case .completed:
            "Leitura concluída"
        }
    }
}
