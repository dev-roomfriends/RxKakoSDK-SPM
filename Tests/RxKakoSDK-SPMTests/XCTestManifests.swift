import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(RxKakoSDK_SPMTests.allTests),
    ]
}
#endif
