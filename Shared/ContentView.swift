//
//  ContentView.swift
//  Shared
//
//  Created by cywang on 2021/3/23.
//

import SwiftUI

#if os(OSX)
   
#elseif os(iOS)
// https://ithelp.ithome.com.tw/articles/10196218
import WebKit

struct ContentView: View {
    var body: some View {
        Webview(url: URL(string: "https://google.com")!)
    }
}

struct Webview: UIViewRepresentable {
    let url: URL

    func makeUIView(context: UIViewRepresentableContext<Webview>) -> WKWebView {
        let webview = WKWebView()

        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)

        return webview
    }

    func updateUIView(_ webview: WKWebView, context: UIViewRepresentableContext<Webview>) {
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)
    }
}

#endif
/*struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
