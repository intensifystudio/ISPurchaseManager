//
//  ISPurchaseController.swift
//  Cize
//
//  Created by Ziad Tamim on 5/2/16.
//  Copyright © 2016 Intensify Studio. All rights reserved.
//

import Foundation
import StoreKit
import BoltsSwift

class PurchaseController: NSObject {
    
    var currentProductsRequestHandler: ITSProductsRequestHandler!
    
    var validProducts: Set<SKProduct>?
    
    ///--------------------------------------
    // MARK - Products
    ///--------------------------------------
    
    func findPriceProduct(_ productIdentifier: String) -> String?
    {
        let products = validProducts?.filter { $0.productIdentifier == productIdentifier }
        return products?.first?.localizedPrice()
    }
    
    func findProductsAsyncWithIdentifiers(_ productIdentifiers: Set<String>, completion: @escaping (Bool) -> ())
    {
        let request = SKProductsRequest(productIdentifiers: productIdentifiers)
        currentProductsRequestHandler = ITSProductsRequestHandler(request: request)
        currentProductsRequestHandler.findProductsAsync { [weak self] (result, error) in
            result?.invalidProductIdentifiers.forEach{ _ in completion(false) }
            self?.validProducts = result?.validProducts
            completion(true)
            
            self?.currentProductsRequestHandler = nil
        }
    }
    
    func buyProductAsyncWithIdentifier(_ productIdentifier: String) -> Task<Bool>
    {
        let source = TaskCompletionSource<Bool>()
        
        if !canPurchase() {
            let error = NSError(domain: "EsyFit can not use use In-App Purchase. Please authorize payment.", code: 0, userInfo: nil)
            source.set(error: error)
        }
        else {
            for product in validProducts! {
                if product.productIdentifier == productIdentifier {
                    transactionObserver.handle(productIdentifier, runOnceBlock: { (error) in
                        if let error = error {
                            source.set(error: error)
                        } else {
                            source.set(result: true)
                        }
                    })
                    let payment = SKPayment(product: product)
                    paymentQueue.add(payment)
                }
            }
        }
        return source.task
    }
    
    func canPurchase() -> Bool
    {
        return SKPaymentQueue.canMakePayments()
    }
    
    ///--------------------------------------
    // MARK - Accessors
    ///--------------------------------------
    
    lazy var paymentQueue: SKPaymentQueue = {
        return SKPaymentQueue.default()
    }()
    
    lazy var transactionObserver: PaymentTransactionObserver = {
        let _transactionObserver = PaymentTransactionObserver()
        self.paymentQueue.add(_transactionObserver)
        return _transactionObserver
    }()
}

