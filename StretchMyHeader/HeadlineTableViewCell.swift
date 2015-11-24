//
//  HeadlineTableViewCell.swift
//  StretchMyHeader
//
//  Created by Samer Rohani on 2015-11-24.
//  Copyright © 2015 Samer Rohani. All rights reserved.
//

import UIKit

class HeadlineTableViewCell: UITableViewCell {

    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var headline: UILabel!
    


    override func awakeFromNib() {
        super.awakeFromNib()
        
    }


    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
