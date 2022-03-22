import XCTest
@testable import FeedFusionLogger

final class FeedFusionLoggingTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(FeedFusionLogging().text, "Hello, World!")
        
        let logger = Logger("Test", "SUB")
        
        logger.verbose("Hello There", tag: "test")
        logger.trace("Hello There", tag: "test")
        logger.debug("Hello There", tag: "test")
        logger.info("Hello There", tag: "test")
        logger.notice("Hello There", tag: "test")
        logger.warning("Hello There", tag: "test")
        logger.critical("Hello There", tag: "test")

    }
}
