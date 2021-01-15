//
//  UIDevice+extension.swift
//  Created on 2021/1/15
//  Description <#文件描述#>

//  Copyright © 2021 Huami inc. All rights reserved.
//  @author zhengwenxiang(zhengwenxiang@huami.com)  

import Foundation
import UIKit

extension UIDevice {
    var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    var isMac: Bool {
        return UIDevice.current.userInterfaceIdiom == .mac
    }
}
