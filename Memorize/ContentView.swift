//
//  ContentView.swift
//  Memorize
//
//  Created by Joao Paulo on 18/11/25.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🎃", "👻", "💀", "🧟", "👽", "🤡", "👻", "🎃", "🕷️", "👽", "🤡", "👻", "🎃", "🕷️"]

    @State var cardCount = 4

    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }

    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button {
            cardCount += offset
        } label: {
            Image(systemName: symbol)
        }
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }

    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))] ) {
            ForEach(0..<cardCount, id: \.self) { index in
                cardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }

    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }

    var cardAdder: some View {
       cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct cardView: View {
    let content: String

   @State var isFaceUp: Bool = false

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
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
