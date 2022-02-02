//
//  SwiftUIView.swift
//  JoshanRai-UnitConverter
//
//  Created by Joshan Rai on 2/1/22.
//

import SwiftUI

struct TemperatureConversionView: View {
    //  Dynamic Variables
    @State private var temperatureAmount = 0.0
    
    let temperatureTypes = ["Celcius", "Fahrenheit", "Kelvin"]
    @State private var selectedTemperatureInputType = "Celcius"
    @State private var selectedTemperatureOutputType = "Celcius"
    
    @FocusState private var amountIsFocus: Bool
    
    //  Variable Methods
    func temperatureConversion() -> String {
        let temperature = Double(temperatureAmount)
        
        let celciusToFahrenheit = ((temperature * 9) / 5) + 32
        let celciusToKelvin = temperature + 273.15
        
        let fahrenheitToCelcius = ((temperature - 32) * 5) / 9
        let fahrenheitToKelvin = (((temperature - 32) * 5) / 9) + 273.15
        
        let kelvinToCelcius = temperature - 273.15
        let kelvinToFahrenheit = (((temperature - 273.15) * 9 ) / 5) + 32
        
        switch selectedTemperatureInputType {
        case "Celcius":
            switch selectedTemperatureOutputType {
            case "Fahrenheit":
                return "\(celciusToFahrenheit.formatted()) °F"
            case "Kelvin":
                return "\(celciusToKelvin.formatted()) K"
            default:
                return "\(0)"
            }
        case "Fahrenheit":
            switch selectedTemperatureOutputType {
            case "Celcius":
                return "\(fahrenheitToCelcius.formatted()) °C"
            case "Kelvin":
                return "\(fahrenheitToKelvin.formatted()) K"
            default:
                return "\(0)"
            }
        case "Kelvin":
            switch selectedTemperatureOutputType {
            case "Celcius":
                return "\(kelvinToCelcius.formatted()) °C"
            case "Fahrenheit":
                return "\(kelvinToFahrenheit.formatted()) °F"
            default:
                return "\(0)"
            }
        default:
            return "\(0)"
        }
    }
    
    var body: some View {
        List {
            
            //  Temperature Amount Input Section
            Section {
                TextField("Temperature to Convert", value: $temperatureAmount, format: .number)
                    .keyboardType(.decimalPad).focused($amountIsFocus)
            } header: {
                Text("Temperature Amount")
            } footer: {
                Text("Input temperature amount to convert above.")
            }
            
            Section {
                //  Temperature Convert From Picker Section
                Picker("Convert from", selection: $selectedTemperatureInputType) {
                    ForEach(temperatureTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                //  Temperature Convert To Picker Section
                Picker("Convert to", selection: $selectedTemperatureOutputType) {
                    ForEach(temperatureTypes, id: \.self) {
                        Text($0)
                    }
                }
            } header: {
                Text("Temperature Conversion Type")
            }
            
            //  Converted Temperature Output Section
            Section {
                Text(temperatureConversion())
            } header: {
                Text("Converted Temperature")
            }
        } .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    amountIsFocus = false
                }
            }
        }
        .navigationTitle("Temperature Conversion")
        .navigationBarTitleDisplayMode(.inline)
    }
}
