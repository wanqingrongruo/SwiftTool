//
//  Date+extension.swift
//  Created on 2020/12/23
//  Description <#文件描述#>

import Foundation

extension Date {
    
    // 与当前时间的间隔秒
    static func second(from referenceDate: Date) -> Int {
        return Int(Date().timeIntervalSince(referenceDate).rounded())
    }
}
