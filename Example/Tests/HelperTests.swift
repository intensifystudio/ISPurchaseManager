//
//  HelperTests.swift
//  PurchaseManager
//
//  Created by Ziad on 12/7/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
import StoreKit
@testable import PurchaseManager

class HelperTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}

extension HelperTests {
    
    class MockProduct: SKProduct {
        
        var mockPrice: NSDecimalNumber?
        
        override var price: NSDecimalNumber {
            return mockPrice ?? 0
        }
        
    }
}
