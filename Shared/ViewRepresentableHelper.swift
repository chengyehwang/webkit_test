#if os(macOS)
import SwiftUI
import WebKit
public typealias ViewRepresentable = NSViewRepresentable
public typealias NativeView = NSView
#elseif os(iOS)
import SwiftUI
import WebKit
import UIKit
public typealias ViewRepresentable = UIViewRepresentable
public typealias NativeView = UIView
#endif

public protocol ViewRepresentableHelper: ViewRepresentable {
    associatedtype ViewType: NativeView
    var configuration: (ViewType) -> () { get set }
    func new() -> ViewType
}

public extension ViewRepresentableHelper {
    func new() -> ViewType { ViewType() }
}

public extension ViewRepresentableHelper {
    func makeView(_ context: Context) -> ViewType {
        let view = new()
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return view
    }
    func updateView(_ view: ViewType, _ context: Context) { configuration(view) }

    func makeUIView(context: Context) -> ViewType { makeView(context) }
    func makeNSView(context: Context) -> ViewType { makeView(context) }
    func updateUIView(_ uiView: ViewType, context: Context) { updateView(uiView, context) }
    func updateNSView(_ nsView: ViewType, context: Context) { updateView(nsView, context) }
}
