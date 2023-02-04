//
//  GridIcons.swift
//  LOTR CONVERTER
//
//  Created by Abdul Rehman on 03/02/2023.
//

import SwiftUI

struct GridIcons: View {
    @State var gridLayout = [GridItem(),GridItem(),GridItem() ]
    @Binding var currency : Currency
    var body: some View {
        LazyVGrid(columns:gridLayout){
            ForEach(0..<5){ i in
                
                        // icons
                
                if(Currency.allCases[i]==currency){
                    CurrencyIcon(title: CurrencyText.allCases[i].rawValue, coinImg: CurrencyImg.allCases[i].rawValue)
                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 5).opacity(0.5) ).shadow( color: .black,radius: 9 )
                    
                }else{
                    CurrencyIcon(title: CurrencyText.allCases[i].rawValue, coinImg: CurrencyImg.allCases[i].rawValue)
                        .onTapGesture {
                            print("tab")
                            currency = Currency.allCases[i]
                        }
                }
               
                
            }
        }
        .padding([.bottom, .trailing, .leading])
        
        
    }
}

struct GridIcons_Previews: PreviewProvider {
    static var previews: some View {
        GridIcons(currency: .constant(.silverPiece))
    }
}
