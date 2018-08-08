//
//  Item.swift
//  Homepwner
//
//  Created by Drew Sullivan on 8/3/18.
//  Copyright © 2018 Drew Sullivan. All rights reserved.
//

import UIKit

class Item : NSObject {
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: Date
    let itemKey: String
    
    init(name: String, serialNumber: String?, valueInDollars: Int) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        self.itemKey = UUID().uuidString
        
        super.init()
    }
    convenience init(random: Bool = false) {
        if random {
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            var idx = arc4random_uniform(UInt32(adjectives.count))
            let randAdjective = adjectives[Int(idx)]
            
            idx = arc4random_uniform(UInt32(nouns.count))
            let randNoun = nouns[Int(idx)]
            
            let randName = "\(randAdjective) \(randNoun)"
            let randValue = Int(arc4random_uniform(100))
            let randSerialNum = UUID().uuidString.components(separatedBy: "-").first!
            
            self.init(name: randName, serialNumber: randSerialNum, valueInDollars: randValue)
        } else {
            self.init(name: "", serialNumber: nil, valueInDollars: 0)
        }
    }
}
