//
//  Date+Extension.swift
//  ATurkcellDb
//
//  Created by Sefa Aycicek on 4.10.2024.
//

import UIKit

extension Date {
    func toString(format: DateFormatterType) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "tr_TR")
        //formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }
}

extension String {
    func toDate(format: DateFormatterType) -> Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "tr_TR")
        formatter.dateFormat = format.rawValue
        return formatter.date(from: self)
    }
}

enum DateFormatterType : String {
    case yearMonthDayFormat = "yyyy mm dd"
    case yearMonthDayNameFormat = "yyyy MMMM dd"
}
