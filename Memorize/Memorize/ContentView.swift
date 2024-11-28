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
        HStack {
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
                CardView()
                CardView()
        
        // Modifiers applied to the VStack
    
    }
        .foregroundColor(.orange)
        .padding()
    
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12.0)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2.0)
                    
                Text("👍")
                    .font(.largeTitle)
                    .padding()
            } else {
                base.fill()
                    
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
    

    
        


#Preview {
    ContentView()
}
