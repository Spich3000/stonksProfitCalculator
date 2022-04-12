//
//  SellPriceView.swift
//  stonksProfitCalculator
//
//  Created by Дмитрий Спичаков on 22.03.2022.
//

import SwiftUI

struct SellPriceView: View {
    
    @State private var quantityOfToken = ""
    @State private var boughtPrice = ""
    @State private var iWantPercentage = ""
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack(spacing: 30) {
                    
                    TextField("Enter quantity of token", text: $quantityOfToken)
                        .textFieldClearButton(text: $quantityOfToken)
                        .title
                    
                    TextField("Enter bought price", text: $boughtPrice)
                        .textFieldClearButton(text: $boughtPrice)
                        .title
                    
                    TextField("Enter profit you want to receive %", text: $iWantPercentage)
                        .textFieldClearButton(text: $iWantPercentage)
                        .title
                }
                //                ZStack {
                VStack(spacing: 20) {
                    VStack(spacing: 15) {
                        VStack(spacing: 5) {
                            Text("Your bought value:")
                                .foregroundColor(.black)
                            Text("\(boughtValue, specifier: "%.2f") $")
                                .foregroundColor(.black)
                        }
                        VStack(spacing: 5) {
                            Text("Set limit order at:")
                                .foregroundColor(.black)
                            Text("\((sellPrice).formatted()) $")
                                .foregroundColor(.black)
                        }
                        VStack(spacing: 5) {
                            Text("Your profit:")
                                .foregroundColor(.black)
                            Text("\(profitValue, specifier: "%.2f") $")
                                .foregroundColor(.black)
                        }
                    }
                    
                    Button(action: {
                        quantityOfToken = ""
                        boughtPrice = ""
                        iWantPercentage = ""
                    }) {
                        Text("Clear")
                            .clearButton
                    } //.shadow(radius: 2)
                } .blockView
                    .padding(.horizontal, 20)
                
                
            }
        }
    }
    
    // Calculation
    var boughtValue: Double {
        ((Double(convert(text: quantityOfToken)) ?? 0) * (Double(convert(text: boughtPrice)) ?? 0) * 1.001)
    }
    var sellPrice: Double {
        ((Double(convert(text: boughtPrice)) ?? 0) * ((1 + (Double(convert(text: iWantPercentage)) ?? 0) / 100) + 0.001))
    }
    var sellValue: Double {
        (Double(convert(text: quantityOfToken)) ?? 0) * sellPrice
    }
    var profitValue: Double {
        guard Double(convert(text: iWantPercentage)) ?? 0 > 0 else { return 0 }
        return sellValue - boughtValue
    }
}

struct SellPriceView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            SellPriceView()
        }
    }
}
