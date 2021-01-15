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
    
    // From iOS 14, there are apps can run in all platform
    // Before iOS 14, isMac is not meaningful
    var isMac: Bool {
        if #available(iOS 14.0, *) {
            return UIDevice.current.userInterfaceIdiom == .mac
        } else {
            return false
        }
    }
}
