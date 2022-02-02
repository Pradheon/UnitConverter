//
//  VolumeConversionView.swift
//  JoshanRai-UnitConverter
//
//  Created by Joshan Rai on 2/1/22.
//

import SwiftUI

struct VolumeConversionView: View {
    @State private var volumeAmount = 0.0
    @State private var volumeType = ["Milliliter", "Liter", "US Legal Cup", "US Liquid Pint", "US Liquid Gallon"]
    
    let volumeTypes = ["Milliliter", "Liter", "US Legal Cup", "US Liquid Pint", "US Liquid Gallon"]
    @State private var selectedVolumeInputType = "Milliliter"
    @State private var selectedVolumeOutputType = "Milliliter"
    
    @FocusState private var amountIsFocus: Bool
    
    //  Variable Methods
    func volumeConversion() -> String {
        let volume = Double(volumeAmount)
        
        //  Milliliter Conversions
        let milliliterToLiter = volume / 1000
        let milliliterToUSCup = volume / 240
        let milliliterToUSPint = volume / 473
        let milliliterToUSGallon = volume / 3785
        
        //  Liter Conversions
        let literToMilliliter = volume * 1000
        let literToUSCup = volume * 4.167
        let literToUSPint = volume * 2.113
        let literToUSGallon = volume / 3.785
        
        //  US Legal Cup Conversions
        let usCupToMilliliter = volume * 240
        let usCupToLiter = volume / 4.167
        let usCupToUSPint = volume / 1.972
        let usCupToUSGallon = volume / 15.773
        
        //  US Legal Pint Conversions
        let usPintToMilliliter = volume * 473
        let usPintToLiter = volume / 2.113
        let usPintToUSCup = volume * 1.972
        let usPintToUSGallon = volume / 8
        
        //  US Legal Gallon Conversions
        let usGallonToMilliliter = volume * 3785
        let usGallonToLiter = volume * 3.785
        let usGallonToUSCup = volume * 15.773
        let usGallonToUSPint = volume * 8
        
        //  Switch
        switch selectedVolumeInputType {
            // Case for Milliliter
        case "Milliliter":
            switch selectedVolumeOutputType {
            case "Liter":
                return "\(milliliterToLiter.formatted()) L"
            case "US Legal Cup":
                return "\(milliliterToUSCup.formatted()) C"
            case "US Legal Pint":
                return "\(milliliterToUSPint.formatted()) pt"
            case "US Legal Gallon":
                return "\(milliliterToUSGallon.formatted()) gal"
            default:
                return "\(0)"
            }
            // Case for Liter
        case "Liter":
            switch selectedVolumeOutputType {
            case "Milliliter":
                return "\(literToMilliliter.formatted()) mL"
            case "US Legal Cup":
                return "\(literToUSCup.formatted()) C"
            case "US Legal Pint":
                return "\(literToUSPint.formatted()) pt"
            case "US Legal Gallon":
                return "\(literToUSGallon.formatted()) gal"
            default:
                return "\(0)"
            }
            // Case for US Legal Cup
        case "US Legal Cup":
            switch selectedVolumeOutputType {
            case "Milliliter":
                return "\(usCupToMilliliter.formatted()) mL"
            case "Liter":
                return "\(usCupToLiter.formatted()) L"
            case "US Legal Pint":
                return "\(usCupToUSPint.formatted()) pt"
            case "US Legal Gallon":
                return "\(usCupToUSGallon.formatted()) gal"
            default:
                return "\(0)"
            }
            // Case for US Legal Pint
        case "US Legal Pint":
            switch selectedVolumeOutputType {
            case "Milliliter":
                return "\(usPintToMilliliter.formatted()) mL"
            case "Liter":
                return "\(usPintToLiter.formatted()) L"
            case "US Legal Cup":
                return "\(usPintToUSCup.formatted()) C"
            case "US Legal Gallon":
                return "\(usPintToUSGallon.formatted()) gal"
            default:
                return "\(0)"
            }
            // Case for US Legal Gallon
        case "US Legal Gallon":
            switch selectedVolumeOutputType {
            case "Milliliter":
                return "\(usGallonToMilliliter.formatted()) mL"
            case "Liter":
                return "\(usGallonToLiter.formatted()) L"
            case "US Legal Cup":
                return "\(usGallonToUSCup.formatted()) C"
            case "US Legal Pint":
                return "\(usGallonToUSPint.formatted()) pt"
            default:
                return "\(0)"
            }
        default:
            return "\(0)"
        }
    }
    
    var body: some View {
        List {
            
            //  Volume Amount Input Section
            Section {
                TextField("Volume to Convert", value: $volumeAmount, format: .number)
                    .keyboardType(.decimalPad).focused($amountIsFocus)
            } header: {
                Text("Volume Amount")
            } footer: {
                Text("Input volume amount to convert above.")
            }
            
            Section {
                //  Volume Convert From Picker Section
                Picker("Convert from", selection: $selectedVolumeInputType) {
                    ForEach(volumeTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                //  Volume Convert To Picker Section
                Picker("Convert to", selection: $selectedVolumeOutputType) {
                    ForEach(volumeTypes, id: \.self) {
                        Text($0)
                    }
                }
            } header: {
                Text("Volume Conversion Type")
            }
            
            //  Converted Volume Output Section
            Section {
                Text(volumeConversion())
            } header: {
                Text("Converted Volume")
            }
        } .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    amountIsFocus = false
                }
            }
        }
        .navigationTitle("Volume Conversion")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct VolumeConversionView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeConversionView()
    }
}
