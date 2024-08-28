//
//  SettingsView.swift
//  Hike
//
//  Created by Murad on 8/24/24.
//

import SwiftUI

struct SettingsView: View {
    // MARK :- PROPERTIES
    private let AlternateiAppIcons: [String] = [
    "AppIcon-MagnifyingGlass",
    "AppIcon-Map",
    "AppIcon-Mushroom",
    "AppIcon-Camera",
    "AppIcon-Backpack",
    "AppIcon-Campfire"
    ]
    
    var body: some View {
        List {
            
            // MARK :-  SECTION : HEADER
            
            Section {
                HStack
                {
                    Spacer()
                    Image (systemName: "laurel.leading")
                        .font(.system(size: 80,weight: .black))
                    VStack ( spacing : -10){
                        Text ("Hike")
                            .font(.system(size: 66,weight: .black))
                        Text ("Editor's Choice")
                    }
                    Image (systemName: "laurel.trailing")
                        .font(.system(size: 80,weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors: [.customGreenLight,.customGreenMedium,.customGreenDark], startPoint: .top, endPoint: .bottom))
                .padding(.top,8)
                VStack (spacing : 8){
                    Text ("Where can  you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text (" The hike looks gorgeous in photos.But is even better once you are actually there.The hike that you hope to do agian someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    Text ("Dust off the boots! Its time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }
            // HEADER
            .listRowSeparator(.hidden)
            
            // MARK :-  SECTION : ICONS
            Section(header: Text("Alternate Icons")){
                ScrollView (.horizontal,showsIndicators: false){
                    HStack (spacing : 12){
                        ForEach(AlternateiAppIcons.indices,id: \.self) { item in
                            Button{
                                print("icon was pressed")
                                UIApplication.shared.setAlternateIconName(AlternateiAppIcons[item]){
                                    error in
                                    if error != nil {
                                        print("Failed request to  update the apps icon :\(AlternateiAppIcons[item])")
                                    }
                                    else {
                                        print("success ! ypu have changer the app icon to \(AlternateiAppIcons[item])")
                                    }
                                }
                            
                            }label: {
                                Image("\(AlternateiAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 80)
                                    .cornerRadius(16)
                            }
                        .buttonStyle(.borderless)
                        }
                    }
                    
                }
            // Scrool View
                .padding(.top,12)
                
                Text("Choose your favourite app icon from the collection above")
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom,12)
                
            }// Section
            .listRowSeparator(.hidden)
            // MARK :-  SECTION : ABOUT
            Section (
            header: Text ("About The app"),
            footer: HStack{
                Spacer()
                Text ("Copyright all the reserved.")
                Spacer()

            }.padding(.vertical,8))
            {
            // 1. BASIC LABELED CONTENT
            //   LabeledContent ("Application",value: "Hike")
                
                //2. ADVANCE LABELED CONTENT
                
                CustomListRowView(rowlabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .red)
                CustomListRowView(rowlabel: "Compatibility", rowIcon: "info.circle", rowContent: "IOs,IpadOS", rowTintColor: .red)
                CustomListRowView(rowlabel: "Technology", rowIcon: "swift", rowContent: "swift", rowTintColor: .orange)
                CustomListRowView(rowlabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                CustomListRowView(rowlabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "SAM", rowTintColor: .pink)
                
                CustomListRowView(rowlabel: "Designer", rowIcon: "paintpalette", rowContent: "ShahenShah Abdullah", rowTintColor: .pink)
                
                CustomListRowView(rowlabel: "Website", rowIcon: "globe", rowTintColor: .indigo,rowLinkLabel: "Credo Academy",rowLinkDestination: "https://credo.academy")
            }
            
            
        }
    }
}

#Preview {
    SettingsView()
}
