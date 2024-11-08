//
//  ContentView.swift
//  DevelopApp
//
//  Created by Oleh on 05.11.2024.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    var cards: [Card] = cardData
    // MARK: - Content
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(cards) { item in
                    CardView(card: item)
                }
            }
            .padding(20)
        }
    }
}

#Preview {
    ContentView()
}
