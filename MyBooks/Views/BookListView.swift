
import SwiftUI
import SwiftData

struct BookListView: View {
    
    @Environment(\.modelContext) private var context // swiftdata
    
    @Query(sort: \Book.title) private var books: [Book]
    
    @State private var createNewBook = false // começa como false
    
    var body: some View {
        
        NavigationStack {
            
            Group {
                
                if books.isEmpty {
                    ContentUnavailableView("Adicione seu primeiro livro", systemImage: "book.fill")
                } else {
                    List {
                        ForEach(books) { book in
                            NavigationLink {
                                EditBookView(book: book)
                            } label: {
                                HStack(spacing: 10) {
                                    book.icon
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Text(book.title).font(.title2)
                                        Text(book.author).foregroundStyle(.secondary)
                                        
                                        if let rating = book.rating {
                                            
                                            HStack {
                                                ForEach(1..<rating, id: \.self) { _ in
                                                    
                                                    Image(systemName: "star.fill")
                                                        .imageScale(.small)
                                                        .foregroundStyle(.yellow)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .onDelete { indexSet in
                            indexSet.forEach { index in
                                let book = books[index]
                                context.delete(book)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Meus Livros")
            .toolbar {
                Button {
                    createNewBook = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                        .foregroundColor(.purple)
                }
            }
            .sheet(isPresented: $createNewBook) {
                NewBookView()
                    .presentationDetents([.medium]) // tamanho da sheet
            }
        }
    }
}

#Preview {
    let preview = Preview()
    preview.addExemples(Book.sampleBooks)
    return BookListView()
        .modelContainer(preview.container)
}
