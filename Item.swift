//
//  Item.swift
//  Homepwner
//
//  Created by Drew Sullivan on 8/3/18.
//  Copyright © 2018 Drew Sullivan. All rights reserved.
//

import UIKit

class Item : NSObject, NSCoding {
    
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: Date
    let itemKey: String
    
    // MARK: - Initializers
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
    
    // MARK: - NSCoding Protocol
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(dateCreated, forKey: "dateCreated")
        aCoder.encode(itemKey, forKey: "itemKey")
        aCoder.encode(serialNumber, forKey: "serialNumber")
        aCoder.encode(valueInDollars, forKey: "valueInDollars")
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! Date
        itemKey = aDecoder.decodeObject(forKey: "itemKey") as! String
        serialNumber = aDecoder.decodeObject(forKey: "serialNumber") as! String?
        valueInDollars = aDecoder.decodeInteger(forKey: "valueInDollars")
        
        super.init()
    }
}
