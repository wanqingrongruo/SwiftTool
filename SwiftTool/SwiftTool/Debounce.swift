//
//  Debounce.swift
//  Created on 2020/12/23
//  Description 防抖器
//  当事件触发超过一段时间之后再执行, 如果这段时间内又有触发事件, 重新计时

//  Copyright © 2020 Huami inc. All rights reserved.
//  @author zhengwenxiang(zhengwenxiang@huami.com)  

import Foundation

class Debouncer {
    public let label: String
    public let interval: DispatchTimeInterval
    private let queue: DispatchQueue
    private let semaphore: DispatchSemaphoreWrapper
    private var workItem: DispatchWorkItem?
    
    public init(label: String, interval: Float, qos: DispatchQoS = .userInteractive) {
        self.interval = .milliseconds(Int(interval * 1000))
        self.label = label
        self.queue = DispatchQueue(label: "com.roni.debouncer.\(label)", qos: qos)
        self.semaphore = DispatchSemaphoreWrapper(value: 1)
    }
    
    public func call(_ callback: @escaping (() -> ())) {
        self.semaphore.sync  { () -> () in
            self.workItem?.cancel()
            self.workItem = DispatchWorkItem {
                callback()
            }
            if let workItem = self.workItem {
                self.queue.asyncAfter(deadline: .now() + self.interval,
                                      execute: workItem)
            }
        }
    }
}