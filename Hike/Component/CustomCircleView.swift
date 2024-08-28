//
//  CustomCircleView.swift
//  Hike
//
//  Created by Murad on 8/24/24.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimatedGradient = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(
                    colors: [
                        .customIndigoMedium,
                        Color("ColorSalmonLight")],
                    startPoint: isAnimatedGradient ? .topLeading : .bottomLeading,
                    endPoint: isAnimatedGradient ? .bottomTrailing : .topTrailing
                )
                )
                
                .onAppear {
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimatedGradient.toggle()
                    }
                }
            
                MotionAnimationView()
        }
        // ZSTaCK
        .frame(width : 256, height : 256)
    }
}

#Preview {
    CustomCircleView()
}
