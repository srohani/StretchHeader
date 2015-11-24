//
//  NewsItem.swift
//  StretchMyHeader
//
//  Created by Samer Rohani on 2015-11-24.
//  Copyright © 2015 Samer Rohani. All rights reserved.
//

import UIKit




class NewsItem: NSObject {

    var category: Category
    var headline: String
    
    init(category: Category, headline: String) {
        self.category = category
        self.headline = headline
    }

}


extension NewsItem {
    enum Category: String {
        case World = "World"
        case MiddleEast = "Middle East"
        case AsiaPacific = "Asia Pacific"
        case Americas = "Americas"
        case Europe = "Europe"
        case Africa = "Africa"
        
        func categoryTextColor() -> UIColor {
            
            switch self {
            case .World:
                return UIColor.redColor()
            case .MiddleEast:
                return UIColor.purpleColor()
            case .AsiaPacific:
                return UIColor.orangeColor()
            case .Americas:
                return UIColor.greenColor()
            case .Europe:
                return UIColor.blueColor()
            case .Africa:
                return UIColor.cyanColor()
            }
            
        }
        
    }
    
}


//here are only 6 types of Categories. World, Americas, Europe, Middle East, Africa and Asia Pacific. Based on which Category, the Category's colour is a set unique colour.