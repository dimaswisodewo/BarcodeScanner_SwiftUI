//
//  Alerts.swift
//  BarcodeScanner
//
//  Created by Dimas Wisodewo on 21/10/23.
//

import Foundation

struct AlertItem {
    let title: String
    let message: String
    let dismissTitle: String
    let dismissAction: (() -> Void)?
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input",
                                              message: "Something is wrong with the camera. We are unable to capture the input.",
                                              dismissTitle: "OK",
                                              dismissAction: {
        print("Invalid Device Input Action")
    })
    
    static let invalidScannedValue = AlertItem(title: "Invalid Scanned Value",
                                              message: "The value scanned is not valid. This app scans EAN-8 and EAN-13.",
                                              dismissTitle: "OK",
                                               dismissAction: {
        print("Invalid Scanned Value Action")
    })
}
