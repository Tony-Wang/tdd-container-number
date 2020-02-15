//
//  Tests.swift
//  Tests
//
//  Created by 黄勇 on 2020/2/14.
//  Copyright © 2020 黄勇. All rights reserved.
//

import XCTest
@testable import tdd_container_number

class Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        //normal
        assert(ContainerNumber.valid(number: "ZGLU3195510"))
        assert(ContainerNumber.valid(number: "TRHU2898840"))

        // error
        assert(!ContainerNumber.valid(number: "TRHU2898844"))

        //less
        assert(!ContainerNumber.valid(number: "TRHU289884"))

        //more
        assert(!ContainerNumber.valid(number: "TRHU28988400"))
    }

    func testRange(){
        assert(ContainerNumber.characterConversion(char: "A") == 10)
        assert(ContainerNumber.characterConversion(char: "=") == nil)
    }


    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
