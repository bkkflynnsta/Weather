//
//  WeatherButton.swift
//  Weather
//
//  Created by Jeffrey Michael Flynn on 30/8/24.
//

import SwiftUI

struct WeatherButton: View {
    
    var buttonTitle: String
    var fgColor: Color
    var bgColor: Color
    
    var body: some View {
        Text(buttonTitle)
            .frame(width:280, height: 50)
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(fgColor)
            .background(bgColor)
            .cornerRadius(10)
    }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButton(buttonTitle: "Toggle Light/Dark Mode", fgColor: .white, bgColor: .blue)
    }
}
