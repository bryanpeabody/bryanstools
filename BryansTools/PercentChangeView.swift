//
//  PercentChangeView.swift
//  BryansTools
//
//  Created by Bryan Peabody on 4/26/24.
//

import SwiftUI

struct PercentChangeView: View {
    @State var initialVal: String = ""
    @State var finalVal: String = ""
    @State var result: String = ""
    
    var body: some View {
        VStack {
            //
            // Top title
            //
            Text("Percent Change")
                .font(.largeTitle)
                .foregroundStyle(.primary)
                .padding()
            
            HStack {
                //
                // Input field
                //
                Text("Initial Value: ")
                TextField("", text: $initialVal)
                    .padding()
                    .frame(width: 150)
                    .foregroundColor(.primary)
                    .font(.headline)
                    .cornerRadius(20)
                    .border(.primary)
                    .keyboardType(.numberPad)
            }
            
            HStack {
                Text("Final Value:  ")
                TextField("", text: $finalVal)
                    .padding()
                    .frame(width: 150)
                    .foregroundColor(.primary)
                    .font(.headline)
                    .cornerRadius(20)
                    .border(.primary)
                    .keyboardType(.numberPad)
            }
            
            Button("Convert") {
                let dInitialValue = Double(initialVal) ?? 0.0
                let dFinalValue = Double(finalVal) ?? 0.0
                
                result = String(format: "%.0f",
                                calculatePercentChange(
                                    initial: dInitialValue,
                                    final: dFinalValue)) + "%"
            }
            .disabled(!isNumber(s: initialVal) && !isNumber(s: finalVal) ? true : false)
            .padding()
            .background(isNumber(s: initialVal) && isNumber(s: finalVal) ? Color.blue : Color.gray)
            .foregroundColor(Color.white)
            .padding(20)
            
            
            //
            // Result output
            //
            Text("\(result)")
                .padding(50)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
    }
}

func calculatePercentChange(initial: Double, final: Double) -> Double {
    return ((final - initial) / initial) * 100
}

#Preview {
    PercentChangeView()
}
