//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Dimas Wisodewo on 20/10/23.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $viewModel.scannedCode,
                            alertItem: $viewModel.alertItem,
                            isStartScan: $viewModel.isStartScan)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                    .frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(viewModel.statusColor)
                    .padding()
                
                if !viewModel.isStartScan {
                    StartScanningButton(scannedCode: $viewModel.scannedCode,
                                        isStartScan: $viewModel.isStartScan)
                }
            }
            .navigationTitle("Barcode Scanner")
            .alert(viewModel.alertTitle,
                   isPresented: $viewModel.isShowingAlert,
                   presenting: viewModel.alertItem) { alertItem in
                Button(alertItem.dismissTitle) {
                    alertItem.dismissAction?()
                }
            } message: { alertItem in
                Text(alertItem.message)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
