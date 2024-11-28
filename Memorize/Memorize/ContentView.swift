//
//  ContentView.swift
//  Memorize
//
//  Created by Brandon Yates on 11/26/24.
//

import SwiftUI

//struct - or structure (Not a class, not OOP)

struct ContentView: View { // this struct, ContentView, behaves like a view
    let emojis: Array<String> = ["👻", "🤖", "💡", "💣", "🍏", "🍅", "🚗"]
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<cardCount, id: \.self) {
                    index in CardView(isFaceUp: true, content: emojis[index])
                }
            }
            HStack {
                Button("Add Card") {
                    cardCount += 1
                }
                
                Button("Remove Card") {
                    cardCount -= 1
                }
            }
            }
            // Modifiers applied to the VStack
            .foregroundColor(.orange)
            .padding()
        }
    
    }


struct CardView: View {
    @State var isFaceUp: Bool = false
    let content: String
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12.0)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2.0)
                    
                Text(content)
                    .font(.largeTitle)
                    .foregroundColor(.black)
        
            } else {
                base.fill()
                    
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
    

    
        


#Preview {
    ContentView()
}
