//
//  Utils.swift
//  BryansTools
//
//  Created by Bryan Peabody on 4/26/24.
//

import Foundation

//
// Utility function for checking if a string is numeric.
//
func isNumber(s: String) -> Bool {
    return Double(s) != nil
}


//
// Measurement calculations
//
func convertMetersToFeet(meters: String) -> String {
    let metersDouble: Double = Double(meters) ?? 0.0
    
    let heightMeters = Measurement(value: metersDouble, unit: UnitLength.meters)
    let heightFeet = heightMeters.converted(to: UnitLength.feet)
    
    return String(format: "%.2f", heightFeet.value) + " ft"
}

func convertMetersToInches(meters: String) -> String {
    let metersDouble: Double = Double(meters) ?? 0.0
    
    let heightMeters = Measurement(value: metersDouble, unit: UnitLength.meters)
    let heightInches = heightMeters.converted(to: UnitLength.inches)
    
    return String(format: "%.2f", heightInches.value) + " in"
}

func convertMetersToCentimeters(meters: String) -> String {
    let metersDouble: Double = Double(meters) ?? 0.0
    
    let heightMeters = Measurement(value: metersDouble, unit: UnitLength.meters)
    let heightInches = heightMeters.converted(to: UnitLength.centimeters)
    
    return String(format: "%.2f", heightInches.value) + " cm"
}

func convertFeetToMeters(feet: String) -> String {
    let feetDouble: Double = Double(feet) ?? 0.0
    
    let heightFeet = Measurement(value: feetDouble, unit: UnitLength.feet)
    let heightMeters = heightFeet.converted(to: UnitLength.meters)
    
    return String(format: "%.2f", heightMeters.value) + " m"
}

func convertFeetToCentimeters(feet: String) -> String {
    let feetDouble: Double = Double(feet) ?? 0.0
    
    let heightFeet = Measurement(value: feetDouble, unit: UnitLength.feet)
    let heightCentimeters = heightFeet.converted(to: UnitLength.centimeters)
    
    return String(format: "%.2f", heightCentimeters.value) + " cm"
}

func convertFeetToInches(feet: String) -> String {
    let feetDouble: Double = Double(feet) ?? 0.0
    
    let heightFeet = Measurement(value: feetDouble, unit: UnitLength.feet)
    let heightInches = heightFeet.converted(to: UnitLength.inches)
    
    return String(format: "%.2f", heightInches.value) + " in"
}
