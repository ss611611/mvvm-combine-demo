//
//  mvvm_combine_demoTests.swift
//  mvvm-combine-demoTests
//
//  Created by Jackie Lu on 2024/10/19.
//

import Testing
import Combine
@testable import mvvm_combine_demo

struct mvvm_combine_demoTests {

    var sut: QuoteViewModel!
    var quoteService: MockQuoteServiceType!
    
    mutating func setUp() {
        
        quoteService = MockQuoteServiceType()
        sut = QuoteViewModel(quoteServiceType: quoteService)
        
    }
    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }

}
class MockQuoteServiceType: QuoteServiceType {
    
    var value: AnyPublisher<Quote, Error>?
    func getRandomQuote() -> AnyPublisher<Quote, Error> {
        value ?? Empty().eraseToAnyPublisher()
    }
    
    
}
