//
//  Model.swift
//  ComposotionLayoutBooks
//
//  Created by Артем Галай on 1.09.22.
//

import Foundation

struct CompositionalModel: Hashable {
    var mainTitle: String?
    var description: String?
    var image: String?
    var nubmerOfItem: Int?
}

extension CompositionalModel {
    static let modelsArray = [
        [CompositionalModel(mainTitle: "Feature Collection", description: "Biography", image: "books"),
         CompositionalModel(mainTitle: "Feature Collection", description: "Short Stories", image: "books"),
         CompositionalModel(mainTitle: "Feature Collection", description: "History", image: "books"),
         CompositionalModel(mainTitle: "Feature Collection", description: "Philosophy", image: "books"),
         CompositionalModel(mainTitle: "Feature Collection", description: "Poetry", image: "books")
        ],
        [CompositionalModel(image: "1"),
         CompositionalModel(image: "2"),
         CompositionalModel(image: "3"),
         CompositionalModel(image: "4"),
         CompositionalModel(image: "5")
        ]
//        [CompositionalModel(mainTitle: "Book Six", description: "Description of book six", image: "book6", nubmerOfItem: 6),
//        CompositionalModel(mainTitle: "Book Seven", description: "Description of book seven", image: "book7", nubmerOfItem: 7),
//        CompositionalModel(mainTitle: "Book Eight", description: "Description of book eight", image: "book8", nubmerOfItem: 8),
//        CompositionalModel(mainTitle: "Book Nine", description: "Description of book nine", image: "book9", nubmerOfItem: 9),
//        CompositionalModel(mainTitle: "Book Ten", description: "Description of book ten", image: "book10", nubmerOfItem: 10),
//        CompositionalModel(mainTitle: "Book Eleven", description: "Description of book eleven", image: "book11", nubmerOfItem: 11),
//        CompositionalModel(mainTitle: "Book Twelve", description: "Description of book twelve", image: "book12", nubmerOfItem: 12),
//        CompositionalModel(mainTitle: "Book Thirteen", description: "Description of book thirteen", image: "book13", nubmerOfItem: 13),
//        CompositionalModel(mainTitle: "Book Fourteen", description: "Description of book fourteen", image: "book14", nubmerOfItem: 14)
//        ]
    ]
}
