//
//  ContentView.swift
//  DevelopApp
//
//  Created by Oleh on 05.11.2024.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Content
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(0 ..< 6) { item in
                    CardView()
                }
            }
            .padding(20)
        }
    }
}

#Preview {
    ContentView()
}
