//
//  ContentView.swift
//  HW3.2
//
//  Created by emmisar on 12.09.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var redSliderValue = 0.0
    @State var greenSliderValue = 0.0
    @State var blueSliderValue = 0.0
    
    var body: some View {
        ZStack{
            Color(.systemBlue)
                .opacity(0.7)
                .ignoresSafeArea()
            VStack{
                Color(red: redSliderValue / 255,
                      green: greenSliderValue / 255,
                      blue: blueSliderValue / 255)
                    .clipShape(Rectangle())
                    .frame(width: 300, height: 200)
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 1))
                
                VStack(spacing: -10){
                    SliderStack(sliderValue: $redSliderValue,
                                sliderColor: Color.red)
                    SliderStack(sliderValue: $greenSliderValue,
                                sliderColor: Color.green)
                    SliderStack(sliderValue: $blueSliderValue,
                                sliderColor: Color.blue)
                }
                Spacer()
            }
            .padding(.top, 15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
