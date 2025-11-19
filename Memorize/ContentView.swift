//
//  ContentView.swift
//  Memorize
//
//  Created by Joao Paulo on 18/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            let emojis = ["🎃", "👻", "💀", "🧟", "👽"]

            ForEach(emojis.indices, id: \.self) { index in
                cardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct cardView: View {
    let content: String

   @State var isFaceUp: Bool = false

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)

            if isFaceUp {
                base
                    .foregroundColor(.white)
                base
                    .strokeBorder(lineWidth: 2)

                Text(content)
                    .font(.largeTitle)
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
