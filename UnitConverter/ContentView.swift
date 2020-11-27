//
//  ContentView.swift
//  UnitConverter
//
//  Created by Chun Choi on 2020-11-25.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)    }
}

extension View {
    func titleStyle() -> some View {
        return self.modifier(Title())
    }
}

struct ContentView: View {
    @State private var input = ""
    
    @State private var convertFrom = 0
    @State private var convertTo = 1
    
    var conversionTypes = ["Temperature", "Distance"]
    @State private var conversionType = 0
    
    var conversions = [
        ["Celsius", "Fahrenheit", "Kelvin"],
        ["km", "feet", "yards", "miles"]
    ]
    var measureUnits = [
        ["°C", "°F", "°K"],
        ["km", " feet", " yards", " miles"]
    ]
    
    var toCelsiusClosures: [(Double) -> Double] = [{ $0 }, { ($0 - 32) * 5/9 }, { $0-273.15 }]
    var fromCelsiusClosures: [(Double) -> Double] = [{ $0 }, { $0 * 9/5 + 32 }, { $0+273.15 }]
    var toMetersClosures: [(Double) -> Double] = [{ $0 * 1000 }, { $0 / 3.281 }, { $0 / 1.094 }, { $0 * 1609.344 }]
    var fromMetersClosures: [(Double) -> Double] = [{ $0 / 1000 }, { $0 * 3.281  }, { $0 * 1.094 }, { $0 / 1609.344 }]
    var output: Double {
        guard let input = Double(input) else { return 0 }
        
        if conversionType == 0 {
            // convert to Celsius
            let toCelsius = toCelsiusClosures[convertFrom]
            // convert to Target
            let fromCelsius = fromCelsiusClosures[convertTo]
            return fromCelsius(toCelsius(input))
        } else if conversionType == 1 {
            let toMeters = toMetersClosures[convertFrom]
            let fromMeters = fromMetersClosures[convertTo]
            return fromMeters(toMeters(input))
        } else {
            return 0
        }
    }
   


