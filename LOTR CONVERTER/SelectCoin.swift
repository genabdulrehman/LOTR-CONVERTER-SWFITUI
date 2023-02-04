//
//  SelectCoin.swift
//  LOTR CONVERTER
//
//  Created by Abdul Rehman on 02/02/2023.
//

import SwiftUI

struct SelectCoin: View {
    @Environment(\.dismiss) var dismiss
    @Binding var leftCurrency : Currency
    @Binding var rightCurrency : Currency
    

    var body: some View {
        ZStack{
            // background Image
            Image("parchment")
                .resizable()
                .ignoresSafeArea(.all)
                .background(.brown)
            VStack{
                // text
                Text("Select the currency you're starting with :")
         
                    .fontWeight(.bold )
                    .multilineTextAlignment(.center)
                GridIcons(currency: $leftCurrency)
                
                
                // currency icons
         
                    // text
                    Text("Select the currency you'd like to convert with with :")
                
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                
                
               
                GridIcons(currency: $rightCurrency)
                
                 
           // button
                
                Button(action:{
                    dismiss()
                }){
                    Text("Done")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(.brown)
                        .cornerRadius(10)
                        
                    
                }
            }
            
           
            
        }
    }
}

struct SelectCoin_Previews: PreviewProvider {
    static var previews: some View {
        SelectCoin(leftCurrency: .constant(.silverPiece), rightCurrency:.constant(.goldPenny))
    }
}
