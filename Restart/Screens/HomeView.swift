//
//  HomeView.swift
//  Restart
//
//  Created by Ivan Nikitin on 29.05.2023.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                
                logoImage()
                    .padding(.horizontal, 20)
            }
            
            Text("""
                The time that leads to mastery is
                dependent on the intensity of our focus.
                """)
            .font(.title3)
            .fontWeight(.light)
            .foregroundColor(.secondary)
            .padding(20)
            .multilineTextAlignment(.center)
            
            Spacer()
            
            Button(action: {
                withAnimation {
//                    audioPlayer.
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                isAnimating = true
            }
        }
    }
    
    func logoImage() -> some View {
        Image("character-2")
            .resizable()
            .scaledToFit()
            .padding()
            .offset(y: isAnimating ? 35 : -35)
            .animation(
                Animation
                    .easeOut(duration: 4)
                    .repeatForever()
                , value: isAnimating
            )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
