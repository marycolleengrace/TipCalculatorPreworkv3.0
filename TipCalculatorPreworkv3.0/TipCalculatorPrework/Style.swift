//
//  ViewController.swift
//  TipCalculatorPrework
//
//  Created by Colleen Ponraj on 1/23/21.
//

import Foundation
import UIKit

struct Style {
    
static let textColor = UIColor(named: "Text")!

static let BGColor = UIColor(named: "BgColor")!
    
    static let BGColorBlue = UIColor(named: "Blue")!
    static let BGColorPink = UIColor(named: "Pink")!
    static let BGColorPurple = UIColor(named: "Purple")!
    
    static var theme = 0

    

static func regularFont(_ size: CGFloat) -> UIFont {
    return UIFont(name: "FiraSans-Light", size: size)!
}

static func boldFont(_ size: CGFloat) -> UIFont {
    return UIFont(name: "FiraSans-Regular", size: size)!
}
    
    static func smallFont() -> UIFont {
        return UIFont(name: "FiraSans-Regular", size: 15.0)!
    }
    
    static func mediumFont() -> UIFont {
        return UIFont(name: "FiraSans-Regular", size: 25.0)!
    }
    
    static func largeFont() -> UIFont {
        return UIFont(name: "FiraSans-Regular", size: 35.0)!
    }
    
}
