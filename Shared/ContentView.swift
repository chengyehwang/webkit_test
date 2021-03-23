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
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.uiDelegate = self
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func goBackBtnAction(_ sender: Any) {
        self.webView.goBack()
    }
    @IBAction func loadBtnAction(_ sender: Any) {
        let inputStr = webInputText.text!
        let request = URLRequest.init(url: URL.init(string: inputStr)!)
        self.webView.load(request)
    }
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
