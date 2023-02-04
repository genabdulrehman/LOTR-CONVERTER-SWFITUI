//
//  ExchangeInfo.swift
//  LOTR CONVERTER
//
//  Created by Abdul Rehman on 02/02/2023.
//

import SwiftUI

struct ExchangeInfo: View {
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        
        ZStack {
            Image("parchment")
                .resizable()
                .ignoresSafeArea(.all)
            .background(.brown)
            
            
            VStack{
                Text("Exchange Rates")
                    .font(.largeTitle)
                
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                    
                
               ExchangeRate(leftImage: "goldpiece", rightImage: "goldpenny", text: "1 gold piece is = 5 gold pennies")

                ExchangeRate(leftImage: "goldpenny", rightImage: "silverpiece", text: "1 gold penny is = 5 silver pieces")
                
                ExchangeRate(leftImage: "silverpiece", rightImage: "silverpenny", text: "1 silver piece is = 5 silver pennies")

                ExchangeRate(leftImage: "silverpenny", rightImage: "copperpenny", text: "1 silver penny is = 100 copper pennies")

                // Button
                
                Button(action: {
                    print("Done")
                    dismiss()
                }){
                    Text("Done").foregroundColor(.white)    .padding(.horizontal, 10).font(.headline).bold()
                    // styles
                }
                .frame(width: 80,height: 50 )
                .background(.brown)
                .cornerRadius(20)
                    
                
               
                
            }.foregroundColor(.black)
        }
            
    }
}

struct ExchangeInfo_Previews: PreviewProvider {
    
    static var previews: some View {
        ExchangeInfo().previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
