//
//  WeatherView.swift
//  Weather
//
//  Created by Jeffrey Michael Flynn on 30/8/24.
//

import SwiftUI

struct WeatherView: View {
    
    @State private var isDark = false
    @State private var cities = City.self
    
    var body: some View {
        TabView {
            ZStack {
                BackgroundView(isDark: $isDark)
                VStack {
                    LocationView(cityName: cities.BKK.name)
                    TodaysWeatherView(imageName: isDark ? "cloud.sun.fill" : cities.BKK.forecasts.first!.image,
                                      temperature: cities.BKK.forecasts.first!.temperature)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(cities.BKK.forecasts) { item in
                                // find first element (Today)
                                if let index = cities.BKK.forecasts.firstIndex(where: {$0.id == item.id}) {
                                    // skip if today
                                    if index != 0 {
                                        ForecastView(date: item.date, imageName: item.image, temperature: item.temperature)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button {
                        isDark.toggle()
                    } label: {
                        WeatherButton(buttonTitle: "Toggle Light/Dark Mode", fgColor: .blue, bgColor: .white)
                    }
                    
                    Spacer()
                }
            }
            
            ZStack {
                BackgroundView(isDark: $isDark)
                VStack {
                    LocationView(cityName: cities.LND.name)
                    TodaysWeatherView(imageName: isDark ? "cloud.sun.fill" : cities.LND.forecasts.first!.image,
                                      temperature: cities.LND.forecasts.first!.temperature)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(cities.LND.forecasts) { item in
                                // find first element (Today)
                                if let index = cities.LND.forecasts.firstIndex(where: {$0.id == item.id}) {
                                    // skip if today
                                    if index != 0 {
                                        ForecastView(date: item.date, imageName: item.image, temperature: item.temperature)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button {
                        isDark.toggle()
                    } label: {
                        WeatherButton(buttonTitle: "Toggle Light/Dark Mode", fgColor: .blue, bgColor: .white)
                    }
                    
                    Spacer()
                }
            }
            
            ZStack {
                BackgroundView(isDark: $isDark)
                VStack {
                    LocationView(cityName: cities.HNL.name)
                    TodaysWeatherView(imageName: isDark ? "cloud.sun.fill" : cities.HNL.forecasts.first!.image,
                                      temperature: cities.HNL.forecasts.first!.temperature)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(cities.HNL.forecasts) { item in
                                // find first element (Today)
                                if let index = cities.HNL.forecasts.firstIndex(where: {$0.id == item.id}) {
                                    // skip if today
                                    if index != 0 {
                                        ForecastView(date: item.date, imageName: item.image, temperature: item.temperature)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button {
                        isDark.toggle()
                    } label: {
                        WeatherButton(buttonTitle: "Toggle Light/Dark Mode", fgColor: .blue, bgColor: .white)
                    }
                    
                    Spacer()
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .ignoresSafeArea()
        
    }
}

#Preview {
    WeatherView()
}

struct BackgroundView: View {
    
    @Binding var isDark: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isDark ? .black : .blue,
                                                   isDark ? .gray : Color(.lightBlue)]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct LocationView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct TodaysWeatherView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)ºC")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct ForecastView: View {
    
    var date: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(getThreeLetterDay(date: setDate(dateString: date)))
                .font(.system(size: 16))
                .foregroundColor(.white)
            Text(getShortMonthDay(date: setDate(dateString: date)))
                .font(.system(size: 10))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)º")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

func setDate(dateString: String) -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.date(from: dateString)!
}

func getThreeLetterDay(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEE"
    return formatter.string(from: date).uppercased()
}

func getShortMonthDay(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMM"
    return formatter.string(from: date).uppercased()
}

