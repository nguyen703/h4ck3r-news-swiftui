//
//  WebView.swift
//  h4ck3rNews
//
//  Created by Nguyen NGO on 21/04/2022.
//

import SwiftUI
import WebKit
import Foundation

struct WebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    let urlString: String?
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
