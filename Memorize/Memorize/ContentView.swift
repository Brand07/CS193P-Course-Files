//
//  ContentView.swift
//  Memorize
//
//  Created by Brandon Yates on 11/26/24.
//

import SwiftUI

//struct - or structure (Not a class, not OOP)

struct ContentView: View { // this struct, ContentView, behaves like a view
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 12.0)
                .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 12.0)
                .strokeBorder(lineWidth: 2)
                .foregroundColor(.orange)
                
            
            Text("👍")
        }
        // Modifiers applied to the VStack
        .padding()
        .font(.largeTitle)
        .foregroundColor(.orange)
    
    }
}

#Preview {
    ContentView()
}
