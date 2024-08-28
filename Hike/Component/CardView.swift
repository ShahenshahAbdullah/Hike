//
//  CardView.swift
//  Hike
//
//  Created by Murad on 8/22/24.
//

import SwiftUI
    
    // MARK : - properties

struct CardView : View {
        @State private var imageNumber : Int = 1
        @State private var randomNumber : Int = 1
        @State private var isShowingSheet : Bool = false
        //Mark Func
        func randomImage () {
            repeat {
                
                randomNumber = Int.random(in: 1...5)
            }
            while randomNumber == imageNumber
                    
            imageNumber = randomNumber
        }
    
    var body: some View {
        //MARK :-  CARD
        ZStack {
            CustomBackgroundView()
            
            VStack {
                //MARK :- HEADER
                
                VStack (alignment:.leading){
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(LinearGradient(
                                colors: [.customGrayLight,.customGrayMedium],
                                startPoint: .top,
                            endPoint: .bottom))
                        
                        
                        
                        Spacer()
                        Button {
                            //ACTION: Show a sheet
                            print("The Button was pressed")
                            isShowingSheet.toggle()                       } label: {
                            CustomButtonView()
                        }
                            .sheet(isPresented: $isShowingSheet) {
                                SettingsView()
                                    .presentationDragIndicator(.visible)
                                    .presentationDetents([.medium,.large])
                            }
                        
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and families")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                    
                    
                }//: HEADER
                .padding(.horizontal,30)
                
                //MARK :- MAIN CONTeNT
                ZStack {
                    CustomCircleView()
                    
                    
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 1), value: imageNumber)
                }
                //MARK:- FOOTER
                Button {
                    // Generate a random number
                    print("The Button Was Pressed.")
                    
                    randomImage()
                } label : {
                        Text ("Explore more")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors: [.customGreenLight,.customGreenMedium], startPoint: .top, endPoint: .bottom))
                        .shadow(color: .black.opacity(0.25),
                                radius: 0.25,x:1,y:2)
                        
                    }
                .buttonStyle(GradientButton())
//                .buttonStyle(.borderedProminent) 1st design
//                .tint(.indigo) 1st design
//                .padding(.vertical)
//                .padding(.horizontal,30)
//                .background(
//                    LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom))
//                .cornerRadius(40)
                }
            
            
        }
        // CARD
        .frame(width : 320, height: 570)
    }
        
}

#Preview {
    CardView()
}
