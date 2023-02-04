//
//  ContentView.swift
//  LOTR CONVERTER
//
//  Created by Abdul Rehman on 01/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var leftCurrency : Currency = .silverPenny
    @State var rightCurrency : Currency = .goldPenny
    @State var showSelectedCurrency =  false
    @State var showInfoScreen = false
    @State var leftAmountTemp = ""
    @State var rightAmountTemp = ""
    @State var leftTyping = false
    @State var rightTyping = false
    
    var body: some View{
        ZStack{
            // background image
            Image("background")
                .resizable()
                .ignoresSafeArea(.all)
            
            VStack{
                // title icon
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // currency exchange text
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                
                // row of converter
                HStack{
                    
                    // Silver piece
                    VStack{
                        
                        // icon and text
                        HStack{
                            // icon and text
                            Image(CurrencyImg.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue).resizable().scaledToFit().frame(height: 30)
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue).foregroundColor(.white).font(.headline)
                        }.padding(.bottom, -5)
                            .onTapGesture {
                                print("Toggle")
                                showSelectedCurrency.toggle()
                            }
                            .sheet(isPresented: $showSelectedCurrency){
                                SelectCoin(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                            }
                        // Textfield
                        TextField("Amount", text: $leftAmount, onEditingChanged: {
                            isTyping in
                            leftTyping = isTyping
                            leftAmountTemp = leftAmount
                        })
                            .padding(10)
                            .keyboardType(.decimalPad)
                            
                           
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            .onChange(of: leftTyping ? leftAmount : leftAmountTemp){
                                _ in
                                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                                
                            }
                            .onChange(of: leftCurrency){
                                _ in
                                leftAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency )
                            }
                        
                    }
                   
                    
                    // equal iconz
                    Image(systemName: "equal")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    
                    // golden sign
                    VStack{
                        
                        // icon and text
                        HStack{
                            // icon and text
                            Image(CurrencyImg.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .resizable().scaledToFit()
                                .frame(height: 33)
                            
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                        }.padding(.bottom, -5) .onTapGesture {
                            print("Toggle")
                            showSelectedCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectedCurrency){
                            SelectCoin(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        // Textfield
                        TextField("Amount", text: $rightAmount, onEditingChanged: {
                            isTyping in
                            rightTyping = isTyping
                            rightAmountTemp = rightAmount
                        })
                            .padding(10)
                            .keyboardType(.decimalPad)
                           
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            .multilineTextAlignment(.trailing)
                            .onChange(of: rightTyping ? rightAmount : rightAmountTemp){
                                _ in
                                leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
                            .onChange(of: rightCurrency){
                                _ in
                                rightAmount = rightCurrency.convert(amountString:rightAmount, to: leftCurrency )
                            }
                        
                    }
                }.padding()
                    .background(.black.opacity(0.4)).cornerRadius(50)
                
                Spacer()
                
                
                
                HStack{
                    Spacer()
                    // bottom info icon
                   
                    Button{
                        showInfoScreen.toggle()
                        // opening display page
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .sheet(isPresented: $showInfoScreen){
                        ExchangeInfo()
                    }
                }
             
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
