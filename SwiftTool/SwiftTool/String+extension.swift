//
//  String+extension.swift
//  Created on 2020/12/3
//  Description <#文件描述#>

//  Copyright © 2020 Huami inc. All rights reserved.
//  @author zhengwenxiang(zhengwenxiang@huami.com)  

import Foundation


extension String {
    // 十六进制字符串转 data => 0x68656c6c6f2c20776f726c64 = hello, world
    func hexStringConverToData() -> Data {
        var hexString = self
        var data = Data()
        while !hexString.isEmpty {
            guard let index = hexString.index(hexString.startIndex, offsetBy: 2, limitedBy: hexString.endIndex) else {
                break
            }
            let unit = String(hexString[..<index])
            hexString = String(hexString[index..<hexString.endIndex])
            var ch: UInt64 = 0
            Scanner(string: unit).scanHexInt64(&ch)
            var char = UInt8(ch)
            data.append(&char, count: 1)
        }
        
        return data
    }
}


