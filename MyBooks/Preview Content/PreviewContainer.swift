//
//  PreviewContainer.swift
//  MyBooks
//
//  Created by Marcelle Ribeiro Queiroz on 10/07/24.
//

import Foundation
import SwiftData

struct Preview {
    let container: ModelContainer
    init() {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        do {
            container = try ModelContainer(for: Book.self, configurations: config)
        } catch {
            fatalError("sem conseguir mostrar o Preview")
        }
    }
    
    func addExemples(_ exemples: [Book]) {
        Task { @MainActor in
            exemples.forEach { exemple in
                container.mainContext.insert(exemple)
            }
        }
    }
}
