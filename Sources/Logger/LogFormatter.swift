//
//  File.swift
//  
//
//  Created by Noah Kamara on 15.03.22.
//

import Foundation
import Puppy

public enum LogFormatMode {
    case icons
    case color
    case text
}

class LogFormatter: LogFormattable {
    let system: String
    let subsystem: String
    let mode: LogFormatMode
    
    init(_ system: String, _ subsystem: String, _ mode: LogFormatMode) {
        self.system = system
        self.subsystem = subsystem
        self.mode = mode
    }
    
    func formatMessage(
        _ level: LogLevel,
        message: String,
        tag: String,
        function: String,
        file: String,
        line: UInt,
        swiftLogInfo: [String: String],
        label: String,
        date: Date,
        threadID: UInt64
    ) -> String {
        let date = mode == .icons ? dateFormatter(date, dateFormat: "HH:mm:ss.SSSZZZZZ") : dateFormatter(date)
        let file = shortFileName(file).replacingOccurrences(of: ".swift", with: "")
        var padding: String = ""
        var levelString: String = ""
        
        switch mode {
            case .icons:
                levelString = level.emoji
                
            case .text:
                levelString = "[\(level.description.uppercased())]"
                padding = String(repeating: " ", count: max(9 - level.description.count, 0))
                
            case .color:
                levelString = "[\(level)]"
                padding = String(repeating: " ", count: max(9 - level.description.count, 0))
        }
        
        var message = "\(date) [\(system).\(subsystem)] \(levelString)\(padding) \(file).\(function.split(separator: "(").first ?? "") (#\(line)): \(tag != "" ? "<\(tag)>" : "") \(message)"
        
        if mode == .color {
            message = level.color.foregroundCode + message + level.color.resetCode
        }
        
        return message
    }
}
