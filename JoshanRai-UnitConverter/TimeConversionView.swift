//
//  TimeConversionView.swift
//  JoshanRai-UnitConverter
//
//  Created by Joshan Rai on 2/1/22.
//

import SwiftUI

struct TimeConversionView: View {
    //  Dynamic Variables
    @State private var timeAmount = 0.0
    
    let timeTypes = ["Second", "Minute", "Hour", "Day"]
    @State private var selectedTimeInputType = "Second"
    @State private var selectedTimeOutputType = "Second"
    
    @FocusState private var amountIsFocus: Bool
    
    //  Variable Methods
    func timeConversion() -> String {
        let time = Double(timeAmount)
        
        //  Second Conversion
        let celciusToFahrenheit = ((time * 9) / 5) + 32
        let celciusToKelvin = time + 273.15
        
        //  Minute Conversion
        let fahrenheitToCelcius = ((time - 32) * 5) / 9
        let fahrenheitToKelvin = (((time - 32) * 5) / 9) + 273.15
        
        //  Hour Conversion
        let kelvinToCelcius = time - 273.15
        let kelvinToFahrenheit = (((time - 273.15) * 9 ) / 5) + 32
        
        switch selectedTimeInputType {
        case "Celcius":
            switch selectedTimeOutputType {
            case "Fahrenheit":
                return "\(celciusToFahrenheit)°F"
            case "Kelvin":
                return "\(celciusToKelvin)K"
            default:
                return "\(0)"
            }
        case "Fahrenheit":
            switch selectedTimeOutputType {
            case "Celcius":
                return "\(fahrenheitToCelcius)°C"
            case "Kelvin":
                return "\(fahrenheitToKelvin)K"
            default:
                return "\(0)"
            }
        case "Kelvin":
            switch selectedTimeOutputType {
            case "Celcius":
                return "\(kelvinToCelcius)°C"
            case "Fahrenheit":
                return "\(kelvinToFahrenheit)°F"
            default:
                return "\(0)"
            }
        default:
            return "\(0)"
        }
    }
    
    var body: some View {
        List {
            
            //  Time Amount Input Section
            Section {
                TextField("Time to Convert", value: $timeAmount, format: .number)
                    .keyboardType(.decimalPad).focused($amountIsFocus)
            } header: {
                Text("Time Amount")
            } footer: {
                Text("Input time amount to convert above.")
            }
            
            Section {
                //  Time Convert From Picker Section
                Picker("Convert from", selection: $selectedTimeInputType) {
                    ForEach(timeTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                //  Time Convert To Picker Section
                Picker("Convert to", selection: $selectedTimeOutputType) {
                    ForEach(timeTypes, id: \.self) {
                        Text($0)
                    }
                }
            } header: {
                Text("Time Conversion Type")
            }
            
            //  Converted Time Output Section
            Section {
                Text(timeConversion())
            } header: {
                Text("Converted Time")
            }
        } .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    amountIsFocus = false
                }
            }
        }
        .navigationTitle("Time Conversion")
    }
}

struct TimeConversionView_Previews: PreviewProvider {
    static var previews: some View {
        TimeConversionView()
    }
}
