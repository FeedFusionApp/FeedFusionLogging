//
//  File.swift
//  
//
//  Created by Noah Kamara on 15.03.22.
//

import Foundation
import Puppy

public class Logger {
    public let logger: Puppy
    
    internal let system: String
    internal var subsystem: String
    internal let level: LogLevel
    internal var mode: LogFormatMode
    
    
    internal let console: ConsoleLogger
    
    public init(_ system: String, _ subsystem: String, level: LogLevel, mode: LogFormatMode = .text) {
        self.system = system
        self.subsystem = subsystem
        self.level = level
        self.mode = mode
        
        self.logger = Puppy.default
        
        self.console = ConsoleLogger("com.example.yourapp.console")
        console.format = LogFormatter(system, subsystem, mode)
        logger.add(console, withLevel: level)
    }
    
    @inlinable
    public func trace(_ message: @autoclosure () -> String, tag: String = "", function: String = #function, file: String = #file, line: UInt = #line) {
        logger.trace(message(), tag: tag, function: function, file: file, line: line)
    }
    
    @inlinable
    public func verbose(_ message: @autoclosure () -> String, tag: String = "", function: String = #function, file: String = #file, line: UInt = #line) {
        logger.verbose(message(), tag: tag, function: function, file: file, line: line)
    }
    
    @inlinable
    public func debug(_ message: @autoclosure () -> String, tag: String = "", function: String = #function, file: String = #file, line: UInt = #line) {
        logger.debug(message(), tag: tag, function: function, file: file, line: line)
    }
    
    @inlinable
    public func info(_ message: @autoclosure () -> String, tag: String = "", function: String = #function, file: String = #file, line: UInt = #line) {
        logger.info(message(), tag: tag, function: function, file: file, line: line)
    }
    
    @inlinable
    public func notice(_ message: @autoclosure () -> String, tag: String = "", function: String = #function, file: String = #file, line: UInt = #line) {
        logger.notice(message(), tag: tag, function: function, file: file, line: line)
    }
    
    @inlinable
    public func warning(_ message: @autoclosure () -> String, tag: String = "", function: String = #function, file: String = #file, line: UInt = #line) {
        logger.warning(message(), tag: tag, function: function, file: file, line: line)
    }
    
    @inlinable
    public func error(_ message: @autoclosure () -> String, tag: String = "", function: String = #function, file: String = #file, line: UInt = #line) {
        logger.error(message(), tag: tag, function: function, file: file, line: line)
    }
    
    @inlinable
    public func critical(_ message: @autoclosure () -> String, tag: String = "", function: String = #function, file: String = #file, line: UInt = #line) {
        logger.critical(message(), tag: tag, function: function, file: file, line: line)
    }
}

