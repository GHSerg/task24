//
//  Model.swift
//  URLSessionStartProject
//
//  Created by Alexey Pavlov on 29/11/21.
//

import Foundation
import FileProvider

struct CardsJSON: Decodable {
    let cardJSON: [CardJSON]
}

struct CardJSON: Decodable {
    var name: String?
    var manaCost: String?
    var type: String?
    var rarity: String?
    var setName: String?
    var artist: String?
    var number: String?
}


