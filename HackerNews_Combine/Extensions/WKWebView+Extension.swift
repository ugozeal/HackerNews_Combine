//
//  WKWebView+Extension.swift
//  HackerNews_Combine
//
//  Created by David Okonkwo on 23/07/2022.
//

import Foundation
import WebKit

extension WKWebView {
	static func pageNotFound() -> WKWebView {
		let wk = WKWebView()
		wk.loadHTMLString("<html><body<h1>Page not found!</h1></body</html>", baseURL: nil)
		return wk
	}
}
