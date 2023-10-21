//
//  StartScanningButton.swift
//  BarcodeScanner
//
//  Created by Dimas Wisodewo on 21/10/23.
//

import SwiftUI

struct StartScanningButton: View {
    @Binding var scannedCode: String
    @Binding var isStartScan: Bool
    
    var body: some View {
        Button {
            scannedCode = ""
            isStartScan = true
        } label: {
            Text("Start Scanning")
        }
        .buttonBorderShape(.capsule)
        .buttonStyle(.borderedProminent)
        .padding()
        .font(.title2)
    }
}

struct StartScanningButton_Previews: PreviewProvider {
    static var previews: some View {
        StartScanningButton(scannedCode: .constant("1234"),
                            isStartScan: .constant(true))
    }
}
