//
//  Data+extension.swift
//  Created on 2020/12/3
//  Description <#文件描述#>

//  Copyright © 2020 Huami inc. All rights reserved.
//  @author zhengwenxiang(zhengwenxiang@huami.com)  

import Foundation

extension Data {
    
    func hexEncodedString() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
}
