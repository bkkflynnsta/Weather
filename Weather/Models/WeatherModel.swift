//
//  WeatherModel.swift
//  Weather
//
//  Created by Jeffrey Michael Flynn on 30/8/24.
//

import SwiftUI

struct Weather: Identifiable {
    var id = UUID()
    var day: String
    var image: String
    var temperature: Int
    
    init(id: UUID = UUID(), day: String, image: String, temperature: Int) {
        self.id = id
        self.day = day
        self.image = image
        self.temperature = temperature
    }
}

extension Weather {
    static let MON: Weather =
        Weather(day: "MON", 
                image: "cloud.sun.fill",
                temperature: 30
                )
}

extension Weather {
    static let TUE: Weather =
        Weather(day: "TUE", 
                image: "cloud.sun.fill",
                temperature: 31
                )
}

extension Weather {
    static let WED: Weather =
        Weather(day: "WED", 
                image: "cloud.sun.rain.fill",
                temperature: 32
                )
}

extension Weather {
    static let THU: Weather =
        Weather(day: "THU", 
                image: "cloud.sun.rain.fill",
                temperature: 33
                )
}

extension Weather {
    static let FRI: Weather =
        Weather(day: "FRI", 
                image: "cloud.bolt.rain.fill",
                temperature: 32
                )
}

extension Weather {
    static let SAT: Weather =
        Weather(day: "SAT", 
                image: "sun.max.fill",
                temperature: 35
                )
}

extension Weather {
    static let forecast: [Weather] = [
        MON,
        TUE,
        WED,
        THU,
        FRI,
        SAT,
    ]
}
