//
//  AppDelegate.swift
//  Created on 2020/12/3
//  Description <#文件描述#> 

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let throttler = Throttler(seconds: 1, mode: .trailing)
        for index in 0...9 {
            throttler.throttle {
                print("++++++\(index)")
            }
        }

        let debouncer = Debouncer(label: "debouncer", interval: 1)
        var sum  = 0
        for index in 0...9 {
            sum += index
            debouncer.call {
                print("----\(sum)")
            }
        }

        return true
    }
}
