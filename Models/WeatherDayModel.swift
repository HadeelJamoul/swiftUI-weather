//
//  WeatherDayModel.swift
//  swiftUI-weather
//
//  Created by Hadeel Jamoul on 09/09/2024.
//

import Foundation


/// Codable: to use encode and decode
struct WeatherDayModel : Codable {
    /// let: used to declare constants
    let day : String
    let image : String
    let temprature : Int
}
