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
        let secondToMinute = time / 60
        let secondToHour = time / 3600
        let secondToDay = time / 86400
        
        //  Minute Conversion
        let minuteToSecond = time * 60
        let minuteToHour = time / 60
        let minuteToDay = time / 1440
        
        //  Hour Conversion
        let hourToSecond = time * 3600
        let hourToMinute = time * 60
        let hourToDay = time / 24
        
        //  Day Conversion
        let dayToSecond = time * 86400
        let dayToMinute = time * 1440
        let dayToHour = time * 24
        
        switch selectedTimeInputType {
            // Case for Second
        case "Second":
            switch selectedTimeOutputType {
            case "Minute":
                return "\(secondToMinute.formatted()) min"
            case "Hour":
                return "\(secondToHour.formatted()) hr"
            case "Day":
                return "\(secondToDay.formatted()) hr"
            default:
                return "\(0)"
            }
            // Case for Minute
        case "Minute":
            switch selectedTimeOutputType {
            case "Second":
                return "\(minuteToSecond.formatted()) min"
            case "Hour":
                return "\(minuteToHour.formatted()) hr"
            case "Day":
                return "\(minuteToDay.formatted()) hr"
            default:
                return "\(0)"
            }
            // Case for Hour
        case "Hour":
            switch selectedTimeOutputType {
            case "Minute":
                return "\(hourToMinute.formatted()) min"
            case "Second":
                return "\(hourToSecond.formatted()) hr"
            case "Day":
                return "\(hourToDay.formatted()) hr"
            default:
                return "\(0)"
            }
            // Case for Day
        case "Day":
            switch selectedTimeOutputType {
            case "Minute":
                return "\(dayToMinute.formatted()) min"
            case "Hour":
                return "\(dayToHour.formatted()) hr"
            case "Second":
                return "\(dayToSecond.formatted()) hr"
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
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TimeConversionView_Previews: PreviewProvider {
    static var previews: some View {
        TimeConversionView()
    }
}
