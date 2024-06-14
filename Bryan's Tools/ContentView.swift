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
        }
    }
}

#Preview {
    ContentView()
}
