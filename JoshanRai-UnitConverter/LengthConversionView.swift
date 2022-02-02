//
//  LengthConversionView.swift
//  JoshanRai-UnitConverter
//
//  Created by Joshan Rai on 2/1/22.
//

import SwiftUI

struct LengthConversionView: View {
    @State private var lengthAmount = 0.0
    @State private var lengthType = ["Meter", "Kilometer", "Foot", "Yard", "Mile"]
    
    let lengthTypes = ["Meter", "Kilometer", "Foot", "Yard", "Mile"]
    @State private var selectedLengthInputType = "Meter"
    @State private var selectedLengthOutputType = "Meter"
    
    @FocusState private var amountIsFocus: Bool
    
    //  Variable Methods
    func lengthConversion() -> String {
        let length = Double(lengthAmount)
        
        //  Meter Conversions
        let meterToKilometer = length / 1000
        let meterToFoot = length * 3.281
        let meterToYard = length * 1.094
        let meterToMile = length / 1609
        
        //  Kilometer Conversions
        let kilometerToMeter = length * 1000
        let kilometerToFoot = length * 3281
        let kilometerToYard = length * 1094
        let kilometerToMile = length / 1.609
        
        //  Foot Conversions
        let footToMeter = length / 3.281
        let footToKilometer = length / 3281
        let footToYard = length / 3
        let footToMile = length / 5280
        
        //  Yard Conversions
        let yardToMeter = length / 1.094
        let yardToKilometer = length / 1094
        let yardToFoot = length * 3
        let yardToMile = length / 1760
        
        //  Mile Conversions
        let mileToMeter = length * 1609
        let mileToKilometer = length * 1.609
        let mileToFoot = length * 5280
        let mileToYard = length * 1760
        
        //  Switch
        switch selectedLengthInputType {
            // Case for Meters
        case "Meter":
            switch selectedLengthOutputType {
            case "Kilometer":
                return "\(meterToKilometer.formatted()) km"
            case "Foot":
                return "\(meterToFoot.formatted()) ft"
            case "Yard":
                return "\(meterToYard.formatted()) yd"
            case "Mile":
                return "\(meterToMile.formatted()) mi"
            default:
                return "\(0)"
            }
            // Case for Kilometers
        case "Kilometer":
            switch selectedLengthOutputType {
            case "Meter":
                return "\(kilometerToMeter.formatted()) m"
            case "Foot":
                return "\(kilometerToFoot.formatted()) ft"
            case "Yard":
                return "\(kilometerToYard.formatted()) yd"
            case "Mile":
                return "\(kilometerToMile.formatted()) mi"
            default:
                return "\(0)"
            }
            // Case for Foot
        case "Foot":
            switch selectedLengthOutputType {
            case "Meter":
                return "\(footToMeter.formatted()) m"
            case "Kilometer":
                return "\(footToKilometer.formatted()) km"
            case "Yard":
                return "\(footToYard.formatted()) yd"
            case "Mile":
                return "\(footToMile.formatted()) mi"
            default:
                return "\(0)"
            }
            // Case for Yard
        case "Yard":
            switch selectedLengthOutputType {
            case "Meter":
                return "\(yardToMeter.formatted()) m"
            case "Kilometer":
                return "\(yardToKilometer.formatted()) km"
            case "Foot":
                return "\(yardToFoot.formatted()) ft"
            case "Mile":
                return "\(yardToMile.formatted()) mi"
            default:
                return "\(0)"
            }
            // Case for Mile
        case "Mile":
            switch selectedLengthOutputType {
            case "Meter":
                return "\(mileToMeter.formatted()) m"
            case "Kilometer":
                return "\(mileToKilometer.formatted()) km"
            case "Yard":
                return "\(mileToYard.formatted()) yd"
            case "Foot":
                return "\(mileToFoot.formatted()) ft"
            default:
                return "\(0)"
            }
        default:
            return "\(0)"
        }
    }
    
    var body: some View {
        List {
            
            //  Length Amount Input Section
            Section {
                TextField("Length to Convert", value: $lengthAmount, format: .number)
                    .keyboardType(.decimalPad).focused($amountIsFocus)
            } header: {
                Text("Length Amount")
            } footer: {
                Text("Input length amount to convert above.")
            }
            
            Section {
                //  Length Convert From Picker Section
                Picker("Convert from", selection: $selectedLengthInputType) {
                    ForEach(lengthTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                //  Length Convert To Picker Section
                Picker("Convert to", selection: $selectedLengthOutputType) {
                    ForEach(lengthTypes, id: \.self) {
                        Text($0)
                    }
                }
            } header: {
                Text("Length Conversion Type")
            }
            
            //  Converted Length Output Section
            Section {
                Text(lengthConversion())
            } header: {
                Text("Converted Length")
            }
        } .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    amountIsFocus = false
                }
            }
        }
        .navigationTitle("Length Conversion")
    }
}

struct LengthConversionView_Previews: PreviewProvider {
    static var previews: some View {
        LengthConversionView()
    }
}
