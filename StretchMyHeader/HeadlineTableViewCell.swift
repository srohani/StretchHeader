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
    

    var newsItem: NewsItem? {
        didSet {
            if let item = newsItem {
                category.text = item.category.categoryTextString()
                category.textColor = item.category.categoryTextColor()
                headline.text = item.headline
                
            } else {
                category.text = nil
                headline.text = nil
            }
        }
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }


    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
