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



