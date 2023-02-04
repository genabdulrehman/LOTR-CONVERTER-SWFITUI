//
//  ExchangeRate.swift
//  LOTR CONVERTER
//
//  Created by Abdul Rehman on 02/02/2023.
//

import SwiftUI

struct ExchangeRate: View {
    @State var leftImage: String
    @State var rightImage: String
    @State var text:String
    var body: some View {
        HStack{
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height:33)
            
            Text(text)
                .font(.body)
            
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height:33)
            
        }
    }
}



struct ExchangeRate_Previews: PreviewProvider {
    
    static var previews: some View {
        ExchangeRate(leftImage: "goldpenny", rightImage: "silverpenny", text: "By" ).previewLayout(.sizeThatFits)
    }
}
