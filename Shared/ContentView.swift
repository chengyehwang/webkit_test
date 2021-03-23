//
//  ContentView.swift
//  Shared
//
//  Created by cywang on 2021/3/23.
//

import SwiftUI

#if os(OSX)
   
#elseif os(iOS)
import UIKit
import WebKit
class ViewController: UIViewController, WKUIDelegate {
    @IBOutlet weak var webInputText: UITextField!
    @IBOutlet weak var webview: WKWebView!
}
#endif
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
