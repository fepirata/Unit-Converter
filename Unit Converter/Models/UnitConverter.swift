//
//  UnitConverter.swift
//  Unit Converter
//
//  Created by Felipe Almeida on 2019-01-21.
//  Copyright © 2019 Felipe Almeida. All rights reserved.
//

import Foundation

class UnitConverter {
    
    func degreesFarenheit(degreesCelcius: Int) -> Int {
        return Int(1.8 * Float(degreesCelcius) + 32.0)
    }
    
    func degreesCelcius(degreesFarenheit: Int) -> Int {
//        return Int(1.8 * Float(degreesFarenheit) + 32.0)
        return Int(0.55 * (Float(degreesFarenheit) - 32.0))
    }
    
}
