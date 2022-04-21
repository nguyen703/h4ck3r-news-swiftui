//
//  NetworkManagerTests.swift
//  h4ck3rNewsTests
//
//  Created by Nguyen NGO on 21/04/2022.
//

import XCTest
@testable import h4ck3rNews

class NetworkManagerTests: XCTestCase {

    var networkManager: NetworkManager!
    
    override func setUp() {
        super.setUp()
        networkManager = NetworkManager()
    }
    
    override func tearDown() {
        super.tearDown()
        networkManager = nil
    }
    
    func testFetchDataSuccessfullyWithNoThrow() {
        let url = "http://hn.algolia.com/api/v1/search?tags=front_page"
        XCTAssertNoThrow(try networkManager.fetchData(url))
    }

    func testFetchDataWithEmptyUrlString() {
        let url = ""
        XCTAssertThrowsError(try networkManager.fetchData(url))
    }

    
}
