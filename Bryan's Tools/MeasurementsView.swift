//
//  MeasurementsView.swift
//  Bryan's Tools
//
//  Created by Bryan Peabody on 6/24/24.
//

import SwiftUI

struct MeasurementsView: View {
    @State var result: String = "--"
    @State var measurementSelectionFrom: String = "m"
    @State var measurementSelectionTo: String = "feet"
    @State var inputVal: String = ""
    
    var tempMeasurements = ["m", "feet", "cm", "in"]
    
    var body: some View {
        VStack {
            //
            // Top title
            //
            Text("Measurements")
                .font(.largeTitle)
                .foregroundStyle(.primary)
                .padding()
            
            HStack {
                //
                // Input field from
                //
                TextField("", text: $inputVal)
                    .padding()
                    .frame(width: 100)
                    .foregroundColor(.primary)
                    .font(.headline)
                    .cornerRadius(20)
                    .border(.primary)
                    .keyboardType(.numberPad)
                    .onChange(of: inputVal) {
                        if inputVal.count == 0 {
                            reset()
                        }
                    }
            }
            
            HStack {
                Text("From ")
                    .bold()
                
                //
                // Measurement picker from
                //
                Picker(
                    selection: $measurementSelectionFrom,
                    label: Text("Picker"),
                    content: {
                        ForEach(tempMeasurements, id: \.self) {
                            Text($0)
                        }
                    }
                )
                .pickerStyle(MenuPickerStyle())
                .onChange(of: measurementSelectionFrom) {
                    reset(onlyResult: true)
                }
                
                
                Text("To")
                    .bold()
                
                //
                // Measurement picker from
                //
                Picker(
                    selection: $measurementSelectionTo,
                    label: Text("Picker"),
                    content: {
                        ForEach(tempMeasurements, id: \.self) {
                            Text($0)
                        }
                    }
                )
                .pickerStyle(MenuPickerStyle())
                .onChange(of: measurementSelectionTo) {
                    reset(onlyResult: true)
                }
                
            }
            
            HStack {
                //
                // Convert button
                //
                Button("Convert") {
                    // Meters to...
                    if measurementSelectionFrom == "m" && measurementSelectionTo == "feet" {
                        result = convertMetersToFeet(meters: inputVal)
                    }
                    
                    if measurementSelectionFrom == "m" && measurementSelectionTo == "cm" {
                        result = convertMetersToCentimeters(meters: inputVal)
                    }
                    
                    if measurementSelectionFrom == "m" && measurementSelectionTo == "in" {
                        result = convertMetersToInches(meters: inputVal)
                    }
        
                    // Feet to...
                    if measurementSelectionFrom == "feet" && measurementSelectionTo == "m" {
                        result = convertFeetToMeters(feet: inputVal)
                    }
                    
                    if measurementSelectionFrom == "feet" && measurementSelectionTo == "cm" {
                        result = convertFeetToCentimeters(feet: inputVal)
                    }
                    
                    if measurementSelectionFrom == "feet" && measurementSelectionTo == "in" {
                        result = convertFeetToInches(feet: inputVal)
                    }
                    
                    // Centimeters to...
                    if (measurementSelectionFrom == "cm" || measurementSelectionFrom == "in") {
                        result = "Not implemented."
                    }
                    // Inches to...
                }
                .disabled(!isNumber(s: inputVal) ? true : false)
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
                .buttonBorderShape(.roundedRectangle)
            }
            
            //
            // Result output
            //
            Text("\(result)")
                .padding(50)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Button("Clear") {
                reset()
            }
        }
    }
    
    func reset(onlyResult: Bool = false) {
        if !onlyResult {
            inputVal = ""
        }
        
        result = "--"
    }
}


#Preview {
    MeasurementsView()
}
