//
//  temperatureRange.swift
//  Unit Converter
//
//  Created by Felipe Almeida on 2019-01-21.
//  Copyright © 2019 Felipe Almeida. All rights reserved.
//
import UIKit
import Foundation

class TemperatureRange: NSObject, UIPickerViewDataSource {
    
    let values = (-100...100).map { $0 } //closure
    
    // Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
}
