//
//  Model.swift
//  HackerNews_Combine
//
//  Created by David Okonkwo on 23/07/2022.
//

import Foundation

struct Story: Codable {
	let id: Int
	let title, url: String
}

extension Story {
	static func placeholder() -> Story {
		return Story(id: 0, title: "N/A", url: "")
	}
}
