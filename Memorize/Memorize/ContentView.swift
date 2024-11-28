

import SwiftUI

//struct - or structure (Not a class, not OOP)

struct ContentView: View { // this struct, ContentView, behaves like a view
    let emojis: Array<String> = ["👻", "🤖", "💡", "💣", "🍏", "🍅", "🚗"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            
            Spacer()
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
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(0..<cardCount, id: \.self) {
                index in CardView(isFaceUp: true, content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        
    }
    
    var cardCounters: some View {
        HStack {
            cardAdder
            Spacer()
            cardRemover
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    }


struct CardView: View {
    @State var isFaceUp: Bool = false
    let content: String
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12.0)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2.0)
                Text(content)
                    .font(.largeTitle)
                    .foregroundColor(.black)
            }
            .opacity(isFaceUp ? 1: 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            }
        .onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}

    

    
        


#Preview {
    ContentView()
}
