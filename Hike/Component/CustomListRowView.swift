//
//  CustomListRowView.swift
//  Hike
//
//  Created by Murad on 8/25/24.
//

import SwiftUI

struct CustomListRowView: View {
    
    // MARK :- PROPERTIES
    @State var rowlabel : String
    @State var rowIcon : String
    @State var rowContent : String? = nil
    @State var rowTintColor : Color
    @State var rowLinkLabel : String? = nil
    @State var rowLinkDestination : String? = nil
    
    
    var body: some View {
        LabeledContent {
            // CONTENT
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            } else if (rowLinkLabel != nil &&
                       rowLinkDestination != nil) {
                Link(rowLinkLabel!, destination : URL (string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            } else {
                EmptyView()
            }}
        label : {
            // label
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30,height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowlabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(
            rowlabel: "Website",
            rowIcon: "globe",
            rowContent: nil,
            rowTintColor: .pink,
            rowLinkLabel: "Credo Academy",
            rowLinkDestination: "https//credo.academy"
        )
    
    }
}
