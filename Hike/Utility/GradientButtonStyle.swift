//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Murad on 8/23/24.
//

import Foundation
import SwiftUI

struct GradientButton : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
                .padding(.horizontal,30)
                .background(
                    // conditional Statement with nl Coalescing
                    // Condition ? A : B
                    
                    configuration.isPressed ?
                    // A: When The user pressed Button
                    LinearGradient(colors: [.customGrayMedium, .customGrayLight], startPoint: .top, endPoint: .bottom)
                                                                                          :
                    // B: When the button is not pressed
                 LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom))
                .cornerRadius(40)
    }
}

