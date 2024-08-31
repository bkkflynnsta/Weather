//
//  WeatherModel.swift
//  Weather
//
//  Created by Jeffrey Michael Flynn on 30/8/24.
//

import SwiftUI

struct City: Identifiable {
    var id = UUID()
    var name: String
    var forecasts: [Forecast]

    init(id: UUID = UUID(), name: String, forecasts: [Forecast]) {
        self.id = id
        self.name = name
        // need below mapping of City to Forecast array
        self.forecasts = forecasts.map { Forecast(date: $0.date, image: $0.image, temperature: $0.temperature)}
    }
}

extension City {
    struct Forecast: Identifiable {
        let id: UUID
        var date: String
        var image: String
        var temperature: Int

        init(id: UUID = UUID(), date: String, image: String, temperature: Int) {
            self.id = id
            self.date = date
            self.image = image
            self.temperature = temperature
        }
    }
}

extension City {
    static let BKK: City =
    City(name: "Bangkok, Thailand",
         forecasts: [
            Forecast(date: "2024-08-01", image: "sun.max.fill", temperature: 30 ),
            Forecast(date: "2024-08-02", image: "cloud.sun.fill", temperature: 31 ),
            Forecast(date: "2024-08-03", image: "cloud.sun.rain.fill", temperature: 32 ),
            Forecast(date: "2024-08-04", image: "cloud.sun.rain.fill", temperature: 33 ),
            Forecast(date: "2024-08-05", image: "cloud.bolt.rain.fill", temperature: 32 ),
            Forecast(date: "2024-08-06", image: "cloud.bolt.rain.fill", temperature: 35 ),
            Forecast(date: "2024-08-07", image: "cloud.sun.rain.fill", temperature: 34 ),
            Forecast(date: "2024-08-08", image: "cloud.sun.fill", temperature: 33 ),
            Forecast(date: "2024-08-09", image: "cloud.bolt.rain.fill", temperature: 32 ),
            Forecast(date: "2024-08-10", image: "cloud.sun.rain.fill", temperature: 31 ),
            Forecast(date: "2024-08-11", image: "cloud.bolt.rain.fill", temperature: 31 ),
            Forecast(date: "2024-08-12", image: "cloud.bolt.rain.fill", temperature: 32 ),
            Forecast(date: "2024-08-13", image: "cloud.sun.rain.fill", temperature: 33 ),
            Forecast(date: "2024-08-14", image: "cloud.sun.fill", temperature: 34 )
         ])
}

extension City {
    static let LND: City =
    City(name: "London, England",
         forecasts: [
            Forecast(date: "2024-08-01", image: "cloud.sun.rain.fill", temperature: 19 ),
            Forecast(date: "2024-08-02", image: "cloud.sun.fill", temperature: 17 ),
            Forecast(date: "2024-08-03", image: "cloud.sun.rain.fill", temperature: 19 ),
            Forecast(date: "2024-08-03", image: "cloud.bolt.rain.fill", temperature: 18 ),
            Forecast(date: "2024-08-04", image: "cloud.sun.fill", temperature: 17 ),
            Forecast(date: "2024-08-06", image: "cloud.bolt.rain.fill", temperature: 21 ),
            Forecast(date: "2024-08-07", image: "cloud.sun.rain.fill", temperature: 20 ),
            Forecast(date: "2024-08-05", image: "cloud.sun.rain.fill", temperature: 19 ),
            Forecast(date: "2024-08-09", image: "cloud.bolt.rain.fill", temperature: 18 ),
            Forecast(date: "2024-08-10", image: "cloud.sun.rain.fill", temperature: 17 ),
            Forecast(date: "2024-08-11", image: "cloud.sun.fill", temperature: 19 ),
            Forecast(date: "2024-08-12", image: "cloud.bolt.rain.fill", temperature: 17 ),
            Forecast(date: "2024-08-13", image: "cloud.bolt.rain.fill", temperature: 18 ),
            Forecast(date: "2024-08-14", image: "cloud.sun.fill", temperature: 20 )
         ])
}

extension City {
    static let HNL: City =
    City(name: "Honolulu, Hawaii",
         forecasts: [
            Forecast(date: "2024-08-01", image: "cloud.bolt.rain.fill", temperature: 25 ),
            Forecast(date: "2024-08-02", image: "cloud.sun.rain.fill", temperature: 24 ),
            Forecast(date: "2024-08-03", image: "cloud.sun.fill", temperature: 23 ),
            Forecast(date: "2024-08-04", image: "cloud.bolt.rain.fill", temperature: 23 ),
            Forecast(date: "2024-08-05", image: "cloud.sun.rain.fill", temperature: 23 ),
            Forecast(date: "2024-08-06", image: "cloud.sun.rain.fill", temperature: 27 ),
            Forecast(date: "2024-08-07", image: "cloud.sun.fill", temperature: 28 ),
            Forecast(date: "2024-08-08", image: "cloud.sun.rain.fill", temperature: 27 ),
            Forecast(date: "2024-08-09", image: "cloud.bolt.rain.fill", temperature: 26 ),
            Forecast(date: "2024-08-10", image: "cloud.sun.rain.fill", temperature: 24 ),
            Forecast(date: "2024-08-11", image: "cloud.bolt.rain.fill", temperature: 28 ),
            Forecast(date: "2024-08-12", image: "cloud.sun.fill", temperature: 23 ),
            Forecast(date: "2024-08-13", image: "cloud.bolt.rain.fill", temperature: 24 ),
            Forecast(date: "2024-08-14", image: "cloud.sun.fill", temperature: 27 ),
         ])
}

extension City {
    static let cities: [City] = [
        BKK, LND, HNL
    ]
}
