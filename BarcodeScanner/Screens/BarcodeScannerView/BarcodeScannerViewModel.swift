//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Dimas Wisodewo on 21/10/23.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem? {
        didSet {
            if let _ = self.alertItem {
                isShowingAlert = true
            } else {
                isShowingAlert = false
            }
        }
    }
    @Published var isShowingAlert = false
    @Published var isStartScan = true
    
    var statusText: String {
        scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
    
    var alertTitle: String {
        alertItem == nil ? "Warning" : alertItem!.title
    }
}
