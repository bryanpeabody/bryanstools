//
//  TempConversionView.swift
//  BryansTools
//
//  Created by Bryan Peabody on 4/26/24.
//

import SwiftUI

struct TempConversionView: View {
    @State var result: String = ""
    @State var tempMeasurementSelection: String = "C"
    @State var inputVal: String = ""
    
    var tempMeasurements = ["C", "F"]
    
    var body: some View {
        VStack {
            //
            // Top title
            //
            Text("Temperature Conversion")
                .font(.largeTitle)
                .foregroundStyle(.primary)
                .padding()
            
            HStack {
                //
                // Input field
                //
                TextField("", text: $inputVal)
                    .padding()
                    .frame(width: 100)
                    .foregroundColor(.primary)
                    .font(.headline)
                    .cornerRadius(20)
                    .border(.primary)
                    .keyboardType(.numberPad)
                
                //
                // C or F picker
                //
                Picker(
                    selection: $tempMeasurementSelection,
                    label: Text("Picker"),
                    content: {
                        ForEach(tempMeasurements, id: \.self) {
                            Text($0)
                        }
                    }
                )
                .pickerStyle(MenuPickerStyle())
                
                //
                // Convert button
                //
                Button("Convert") {
                    handleConvertButtonPress(tempMeasurementSelection: tempMeasurementSelection, inputVal: inputVal)
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
        }
    }
    
    //
    // Handles the button press and conversion of the user input
    //
    func handleConvertButtonPress(tempMeasurementSelection: String, inputVal: String) {
        let temp: Double = Double(inputVal) ?? 0.0
        
        if (tempMeasurementSelection == "C") {
            let celsius = Measurement(value: temp, unit: UnitTemperature.celsius)
            result = String(format: "%.0f", celsius.converted(to: .fahrenheit).value) + " °F"
        } else {
            let fahrenheit = Measurement(value: temp, unit: UnitTemperature.fahrenheit)
            result = String(format: "%.0f", fahrenheit.converted(to: .celsius).value) + " °C"
        }
    }
}
