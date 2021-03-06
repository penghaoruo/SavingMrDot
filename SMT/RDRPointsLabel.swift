//
//  MLPointsLabel.swift
//  SMT
//
//  Created by Haoruo Peng on 12/17/15.
//  Copyright © 2015 Haoruo Peng. All rights reserved.
//

import UIKit
import SpriteKit

class RDRPointsLabel: SKLabelNode {
    var number = 0;
    
    override init() {
        super.init()
        self.text = "0"
        number = 0
        self.fontSize = 16
        self.fontColor = constants.textColor
    }
    
    func setMyFontName(name: String) {
        self.fontName = name
    }
    
    func increment() {
        number++
        self.text = String(number)
    }
    
    func setPoints(num: Int) {
        number = num
        self.text = String(number)
    }
    
    func getPoints() -> Int {
        return self.number
    }
    
    func reset() {
        number = 0
        self.text = String(number)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
