//
//  DetailsCell.swift
//  ListingWithCoreData
//
//  Created by Joy Mondal on 03/02/20.
//  Copyright © 2020 Techno-MAC. All rights reserved.
//

import UIKit

class DetailsCell: UITableViewCell {
    @IBOutlet weak var empID : UILabel!
    @IBOutlet weak var name : UILabel!
    @IBOutlet weak var designation : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
