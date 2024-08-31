//
//  Helpers.swift
//  Weather
//
//  Created by Jeffrey Michael Flynn on 31/8/24.
//

import Foundation

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
