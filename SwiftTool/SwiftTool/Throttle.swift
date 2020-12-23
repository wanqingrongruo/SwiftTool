//
//  Throttle.swift
//  Created on 2020/12/23
//  Description 节流器
//  预先设定一个执行周期，事件堆积, 等待到期执行. 进入下一个周期

//  Copyright © 2020 Huami inc. All rights reserved.
//  @author zhengwenxiang(zhengwenxiang@huami.com)  

import Foundation

class Throttler: NSObject {
    private let queue: DispatchQueue = DispatchQueue.global(qos: .background)
    private var job: DispatchWorkItem = DispatchWorkItem(block: {})
    private var previousRun: Date = Date.distantPast
    private var maxInterval: Int
    private let semaphore: DispatchSemaphoreWrapper
    
    init(seconds: Int) {
        self.maxInterval = seconds
        self.semaphore = DispatchSemaphoreWrapper(value: 1)
    }
    
    func throttle(block: @escaping () -> ()) {
        self.semaphore.sync  { () -> () in
            job.cancel()
            job = DispatchWorkItem(){ [weak self] in
                self?.previousRun = Date()
                block()
            }
            let delay = Date.second(from: previousRun) > maxInterval ? 0 : maxInterval
            queue.asyncAfter(deadline: .now() + Double(delay), execute: job)
        }
    }
}

struct DispatchSemaphoreWrapper {
    private let semaphore: DispatchSemaphore
    
    public init(value: Int) {
        self.semaphore = DispatchSemaphore(value: value)
    }
    
    public func sync<R>(execute: () throws -> R) rethrows -> R {
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        defer { semaphore.signal() }
        return try execute()
    }
}
