//
//  Model.swift
//  URLSessionStartProject
//
//  Created by Alexey Pavlov on 29/11/21.
//

import Foundation
import FileProvider

struct CardsJSON: Decodable {
    let cards: [CardJSON]
}

struct CardJSON: Decodable {
    let name: String?
    let manaCost: String?
    let type: String?
    let rarity: String?
    let setName: String?
    let artist: String?
    let number: String?
}


