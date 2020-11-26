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


