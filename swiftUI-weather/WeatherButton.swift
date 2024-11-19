//
//  WeatherButton.swift
//  swiftUI-weather
//
//  Created by Hadeel Jamoul on 23/06/2024.
//

import SwiftUI

struct WeatherButton: View{
    var text: String
    var foregroundColor: Color
    var backgroundColor: Color
    
    var body: some View{
        Text(text)
            .frame(width: 280 , height: 50)
            .foregroundColor(foregroundColor)
            .font(.system(size: 20 , weight: .bold))
            .background(backgroundColor.gradient)
            .cornerRadius(10)
    }
}
