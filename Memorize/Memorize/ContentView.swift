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
            .foregroundColor(.orange)
            HStack {
                
                Button(action: {
                    if cardCount < emojis.count {
                        cardCount += 1
                    }
                }, label: {
                    Image(systemName: "rectangle.stack.badge.plus.fill")
                })
                .imageScale(.large)
                
                Spacer()
                
                Button(action: {
                    if cardCount > 1 {
                        cardCount -= 1
                    }
                }, label: {
                    Image(systemName: "rectangle.stack.badge.minus.fill")
                })
                .imageScale(.large)
            }
            }
            // Modifiers applied to the VStack
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
