//
//  WeatherView.swift
//  Weather
//
//  Created by Jeffrey Michael Flynn on 30/8/24.
//

import SwiftUI

struct WeatherView: View {
    
    @State private var isDark = false
    
    var body: some View {
        TabView {
            // iterate over cities
            ForEach(City.cities) { city in
                ZStack {
                    BackgroundView(isDark: $isDark)
                    VStack {
                        LocationView(cityName: city.name)
                        TodaysWeatherView(imageName: isDark ? "cloud.moon.fill" : city.forecasts.first!.image,
                                          temperature: city.forecasts.first!.temperature)
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 20) {
                                // iterate over city forecasts, skipping the first one
                                ForEach(city.forecasts) { item in
                                    // find first element (Today)
                                    if let index = city.forecasts.firstIndex(where: {$0.id == item.id}) {
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
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .ignoresSafeArea()
    }
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

#Preview {
    WeatherView()
}
