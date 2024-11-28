

import SwiftUI

//struct - or structure (Not a class, not OOP)

struct ContentView: View { // this struct, ContentView, behaves like a view
    let emojis: Array<String> = ["👻", "🤖", "💡", "💣", "🍏", "🍅", "🚗"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            cards
            cardCounters
            
        }
            // Modifiers applied to the VStack
            .padding()
    }
    
    
    var cardAdder: some View {
        return cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var cardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cards: some View {
        HStack {
            ForEach(0..<cardCount, id: \.self) {
                index in CardView(isFaceUp: true, content: emojis[index])
            }
            .imageScale(.large)
            .font(.largeTitle)
        }
        
        

    }
    
    var cardCounters: some View {
        HStack {
            cardAdder
            Spacer()
            cardRemover
        }
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
