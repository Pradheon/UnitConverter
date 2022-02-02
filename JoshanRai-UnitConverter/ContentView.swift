//
//  ContentView.swift
//  JoshanRai-UnitConverter
//
//  Created by Joshan Rai on 2/1/22.
//

import SwiftUI

struct ContentView: View {
    // Dynamic Variables
    @FocusState private var amountIsFocus: Bool
    
    // Variable Methods
    
    // Constants
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    //  Temperature View
                    NavigationLink(destination: TemperatureConversionView()) {
                        Label("Temperature Conversion", systemImage: "thermometer")
                    }
                    
                    //  Length View
                    NavigationLink(destination: LengthConversionView()) {
                        Label("Length Conversion", systemImage: "ruler")
                    }
                    
                    //  Time View
                    NavigationLink(destination: TimeConversionView()) {
                        Label("Time Conversion", systemImage: "clock")
                    }
                    
                    //  Volume View
                    NavigationLink(destination: VolumeConversionView()) {
                        Label("Volume Conversion", systemImage: "drop")
                    }
                } header: {
                    Header()
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
