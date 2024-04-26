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
            
            PercentChangeView()
                .tabItem {
                    Image(systemName: "percent")
                    Text("Percent Change")
                }
            
            Text("Not Implemented")
                .tabItem {
                    Image(systemName: "plus")
                    Text("Percent Increase")
                }
        }
    }
}

#Preview {
    ContentView()
}
