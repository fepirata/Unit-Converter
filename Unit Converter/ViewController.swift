//
//  ViewController.swift
//  Unit Converter
//
//  Created by Felipe Almeida on 2019-01-21.
//  Copyright © 2019 Felipe Almeida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var temperatureRange: TemperatureRange!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperaturePicker: UIPickerView!
    @IBOutlet weak var alexOptions: UISegmentedControl!
    
    
//    private let temperatureValues = (-100...100).map { $0 }
    let unitConverter = UnitConverter()
    let userDefaultsLastRowKey = "defaultCelciusPickerRow"
    var checkingButton = true
    var temporaryLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        temperaturePicker.dataSource = self
        
        temperaturePicker.delegate = self
        
        let defaultPickerRow = initialPickerRow()
        
        temperaturePicker.selectRow(defaultPickerRow, inComponent: 0, animated: true)
        pickerView(temperaturePicker, didSelectRow: defaultPickerRow, inComponent: 0)
//        temperaturePicker.reloadAllComponents()
        
//        temperatureValues = [1, 2, 3, 4, 5]
        
        
    }
    
    func initialPickerRow() -> Int {
        if let savedRow = UserDefaults.standard.object(forKey: userDefaultsLastRowKey) as? Int {
            return savedRow
        }
        return temperaturePicker.numberOfRows(inComponent: 0) / 2
    }
    
    func saveSelectedRow(row: Int) {
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultsLastRowKey)
        defaults.synchronize()
    }
    
//    func displayConvertedTemperatureForRow(row: Int) {
//        let celciusValue = temperatureRange.values[row]
//        temperatureLabel.text = "\(unitConverter.degreesFarenheit(degreesCelcius: celciusValue))°F"
//    }
    
    
        func displayConvertedTemperatureForRow(row: Int) {
            if checkingButton {
                let celciusValue = temperatureRange.values[row]
                temperatureLabel.text = "\(unitConverter.degreesFarenheit(degreesCelcius: celciusValue))°F"
                
            } else {
                let celciusValue = temperatureRange.values[row]
                temperatureLabel.text = "\(unitConverter.degreesCelcius(degreesFarenheit: celciusValue))°C"
                
            }
            
        }
    
    @IBAction func switchTemperature(_ sender: UISegmentedControl) {
        switch alexOptions.selectedSegmentIndex {
        case 0:
            checkingButton = true
            temperaturePicker.reloadComponent(0)
            pickerView(temperaturePicker, didSelectRow: initialPickerRow(), inComponent: 0)
            
            break
        case 1:
            checkingButton = false
            temperaturePicker.reloadComponent(0)
            pickerView(temperaturePicker, didSelectRow: initialPickerRow(), inComponent: 0)
            
            break
        default:
            break
        }
    
        
    }
    
}

extension ViewController: UIPickerViewDelegate {
    
//    // Data Source
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return temperatureValues.count
//    }
    
    // Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if checkingButton {
            return "\(temperatureRange.values[row])°C"
        } else {
            return "\(temperatureRange.values[row])°F"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        displayConvertedTemperatureForRow(row: row)
        saveSelectedRow(row: row)
        
        
        
//        temperatureLabel.text = "\(unitConverter.degreesFarenheit(degreesCelcius: celciusValue)) °F"
        
        
//        let degreesCelcius = Float(temperatureValues[row])
//        let degreesFarenheit = 1.8 * degreesCelcius + 32.0
//        temperatureLabel.text = "\(Int(degreesFarenheit))°F"
    }
    
    
}
