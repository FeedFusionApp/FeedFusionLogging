//
//  File.swift
//  
//
//  Created by Noah Kamara on 16.03.22.
//

import Foundation

extension Logger: CustomStringConvertible {
    public var description: String {
        return "Logger<\(system).\(subsystem)>"
    }
    
    public func child(with subsystem: String) -> Logger {
        return Logger(system, self.subsystem+"-"+subsystem, level: level, mode: mode)
    }
}
