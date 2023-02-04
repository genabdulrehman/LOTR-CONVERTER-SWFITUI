//
//  CurrencyIcon.swift
//  LOTR CONVERTER
//
//  Created by Abdul Rehman on 02/02/2023.
//

import SwiftUI

struct CurrencyIcon: View {
    @State var title:String
    @State var coinImg: String
    var body: some View {
        ZStack {
            Image(coinImg)
                .resizable()
                .scaledToFit()
            .frame(height: 100)
            
            VStack {
                Spacer()
                Text(title)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(4)
                    .background(.brown.opacity(0.8))
                .cornerRadius(10)
            }
        }
        .frame(width:100,height: 100)
        .padding(3)
        .background(.brown.opacity(0.8))
        .cornerRadius(25)
        
    }
}

struct CurrencyIcon_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyIcon(title: "Gold Coin", coinImg:"goldpenny")
            .previewLayout(.sizeThatFits)
    }
}
