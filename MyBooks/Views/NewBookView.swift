
import SwiftUI

struct NewBookView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                
                TextField("Título do Livro", text: $title)
                TextField("Autor(a)", text: $author)
                
                Button("Adicionar") {
                    let newBook = Book(title: title, author: author)
                    context.insert(newBook) // adiciona Livro
                    dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
                .disabled(title.isEmpty || author.isEmpty) // só funciona quando titulo e autor estiverem preenchidos
                .navigationTitle("Novo Livro")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Cancelar") {
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NewBookView()
}
