//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct HeaderView: View {
    var title = "Title"
    var subtitle = "Subtitle"
    var desc = "Use this to..."
    var back = Color("GoldColor")
    var textColor = Color.white
    
    init(_ title: String, subtitle: String, desc: String, back: Color = Color("GoldColor"), textColor: Color = Color.primary) {
        self.title = title
        self.subtitle = subtitle
        self.desc = desc
        self.back = back
        self.textColor = textColor
    }
    
    var body: some View {
        VStack(spacing: 15) {
            if title.isEmpty == false {
                Text(title)
                    .font(.largeTitle)
            }
            
            Text(subtitle)
                .foregroundColor(.gray)
            
            DescView(desc: desc, back: back, textColor: textColor)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView("Title", subtitle: "Subtitle", desc: "What does what")
//                .preferredColorScheme(.dark)
            //HeaderView("Title", subtitle: "Subtitle", desc: "What does what", textColor: .white)
        }
    }
}

struct DescView: View {
    var desc = "Use this to..."
    var back = Color("GoldColor")
    var textColor = Color.primary
    
    var body: some View {
        Text(desc)
            .frame(maxWidth: .infinity)
            .padding()
            .background(back)
            .foregroundColor(textColor)
    }
}

struct Header: View {
    var body: some View {
        Image("HeaderImage")
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity)
            .overlay(Text("Unit Converter")
                        .font(.system(size: 30))
                        .foregroundColor(.white))
            .padding(.horizontal, -40)
            .padding(.top, -50)
    }
}
