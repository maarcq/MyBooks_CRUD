//
//  BookSamples.swift
//  MyBooks
//
//  Created by Marcelle Ribeiro Queiroz on 10/07/24.
//

import Foundation

extension Book {
    static let lastWeek = Calendar.current.date(byAdding: .day, value: -7, to: Date.now)
    static let lastMonth = Calendar.current.date(byAdding: .month, value: -1, to: Date.now)
    static var sampleBooks: [Book] {
        [
            Book(title: "Teste", author: "Teste")
        ]
    }
}
