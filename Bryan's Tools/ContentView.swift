//
//  ContentView.swift
//  BryansTools
//
//  Created by Bryan Peabody on 4/26/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            TempConversionView()
                .tabItem {
                    Image(systemName: "thermometer.sun.fill")
                    Text("Temp Conversion")
                }
             MeasurementsView()
                .tabItem {
                    Image(systemName: "ruler.fill")
                    Text("Measurements")
                }
        }
    }
}

#Preview {
    ContentView()
}
