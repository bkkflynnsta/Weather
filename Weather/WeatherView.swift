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
        ZStack {
            BackgroundView(isDark: $isDark)
            VStack {
                LocationView(cityName: "Bangkok, Thailand")
                TodaysWeatherView(imageName: isDark ? "cloud.moon.fill" : "cloud.sun.fill", temperature: 30)

                HStack(spacing: 20) {
                    ForEach(Weather.forecast) { item in
                        ForecastView(dayOfWeek: item.day, imageName: item.image, temperature: item.temperature)
                    }
                }

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

    var dayOfWeek: String
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16))
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
