import XCTest

@testable import PMKit

final class PMKitTests: XCTestCase {
    func testBluetoothManager() throws {
        XCTAssertNotNil(BluetoothManager.sharedInstance)
    }
}
