//
//  MarvelVM.swift
//  MarvelHeroes
//
//  Created by Himani on 28/10/20.
//  Copyright © 2020 Himani. All rights reserved.
//

import Foundation

class MarvelVM {
    var heroes = [Hero]()
    
    let userDef = UserDefaults.standard
    
    func setCollection() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(MarvelHeroResponse(responseList: heroes))
            userDef.set(data, forKey: Constants.collectionName)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func getHeroList() {
        if let data = userDef.data(forKey: Constants.collectionName) {
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(MarvelHeroResponse.self, from: data)
                heroes = decodedData.responseList
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            heroes = [Constants.hero1, Constants.hero2, Constants.hero3, Constants.hero1, Constants.hero2, Constants.hero3, Constants.hero1, Constants.hero2, Constants.hero3]
            setCollection()
        }
    }
    
    func add(hero: Hero) {
        heroes.append(hero)
        setCollection()
    }
    
    func deleteHeroFromTheList(index: Int) {
//        heroes.remove(at: index)
        setCollection()
    }
}
