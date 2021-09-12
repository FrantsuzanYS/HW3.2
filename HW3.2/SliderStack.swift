//
//  SliderStack.swift
//  HW3.2
//
//  Created by emmisar on 12.09.2021.
//

import SwiftUI

struct SliderStack: View {
    
    @Binding var sliderValue: Double
    @State var alertPresent = false
    
    let sliderColor: Color
    
    var body: some View {
        HStack{
            Text("\(lround(sliderValue))")
                .frame(width: 50)
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .accentColor(sliderColor)
            TextField("0", value: $sliderValue, formatter: NumberFormatter(), onCommit:  {
                if !(0...255).contains(self.sliderValue) {
                    alertPresent = true
                    self.sliderValue = 0
                }
            })
            .multilineTextAlignment(.center)
            .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 2))
            .frame(width: 50)
            .background(Color.white)
            .alert(isPresented: $alertPresent) {
                Alert(title: Text("Wrong format!"),
                      message: Text("Please enter value from 0 to 255"),
                      dismissButton: Alert.Button.cancel(Text("Ok")))}
            .padding()
        }
    }
}

struct SliderStack_Previews: PreviewProvider {
    static var previews: some View {
        SliderStack(sliderValue: .constant(100),
                    sliderColor: Color.red)
    }
}
