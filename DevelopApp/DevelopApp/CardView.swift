//
//  CardView.swift
//  DevelopApp
//
//  Created by Oleh on 07.11.2024.
//

import SwiftUI

struct CardView: View {
    var card: Card
    
    @State private var fadeIn: Bool = false
    @State private var moveDownward: Bool = false
    @State private var moveUpward: Bool = false
    @State private var showAlert: Bool = false
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(fadeIn ? 1.0 : 0.0)
            
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .italic()
            }
            .offset(
                y: moveDownward ? -218 : -300
            )
            Button(action: {
                playSound(sound: "sound-chime", type: "mp3")
                self.hapticImpact.impactOccurred()
                self.showAlert.toggle()
            }) {
                HStack {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .accentColor(.white)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .accentColor(.white)
                }
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(
                    LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            }
            .offset(
                y: moveUpward ? 210 : 300
            )
        }
        .frame(width: 335, height: 545)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear() {
            withAnimation(.linear(duration: 1.2)) {
                self.fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                self.moveDownward.toggle()
                self.moveUpward.toggle()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(card.title),
                  message: Text(card.message),
                  dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    CardView(card: cardData[5])
}
