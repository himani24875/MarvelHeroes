//
//  Hero.swift
//  MarvelHeroes
//
//  Created by Himani on 28/10/20.
//  Copyright © 2020 Himani. All rights reserved.
//

import Foundation

struct MarvelHeroResponse: Codable {
    var responseList: [Hero]
}

struct Hero: Codable {
    var name: String
    var desc: String
    var profileImg: String
}
