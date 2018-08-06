//
//  ItemCell.swift
//  Homepwner
//
//  Created by Drew Sullivan on 8/6/18.
//  Copyright © 2018 Drew Sullivan. All rights reserved.
//

import UIKit

class ItemCell : UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
        serialNumberLabel.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
    }
}
