//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Dimas Wisodewo on 20/10/23.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    @Binding var isStartScan: Bool
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ScannerView>) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
        uiViewController.isStartScan = isStartScan
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    // Coordinator
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.scannerView.scannedCode = ""
                switch error {
                case .invalidDeviceInput:
                    self.scannerView.alertItem = AlertContext.invalidDeviceInput
                case .invalidScannedValue:
                    self.scannerView.alertItem = AlertContext.invalidScannedValue
                }
            }
        }
        
        func didStopScan() {
            scannerView.isStartScan = false
        }
    }
}
