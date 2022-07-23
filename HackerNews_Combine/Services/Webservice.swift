//
//  Webservice.swift
//  HackerNews_Combine
//
//  Created by David Okonkwo on 23/07/2022.
//

import Foundation
import Combine
import SwiftUI

class Webservice {
	func getAllTopStories() -> AnyPublisher<[Story], Error> {
		guard let url = URL(string: "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty") else {
			fatalError("Invalid url")
		}
		return URLSession.shared.dataTaskPublisher(for: url)
			.receive(on: RunLoop.main)
			.map(\.data)
			.decode(type: [Int].self, decoder: JSONDecoder())
			.flatMap({ storyIds in
				return self.mergeStories(ids: storyIds)
			})
			.scan([], { stories, story -> [Story] in
				return stories + [story]
			})
			.eraseToAnyPublisher()
	}
	
	func getStoryById(storyId: Int) -> AnyPublisher<Story, Error> {
		guard let url = URL(string: "https://hacker-news.firebaseio.com/v0/item/\(storyId).json?print=pretty") else {
			fatalError("Invalid url")
		}
		
		return URLSession.shared.dataTaskPublisher(for: url)
			.receive(on: RunLoop.main)
			.map(\.data)
			.decode(type: Story.self, decoder: JSONDecoder())
			.eraseToAnyPublisher()
	}
	
	private func mergeStories(ids storyIds: [Int]) -> AnyPublisher<Story, Error> {
		let storyIds = Array(storyIds)
		
		let initialPublisher = getStoryById(storyId: storyIds[0])
//		let remainder = Array(storyIds.dropFirst())
		
		return storyIds.reduce(initialPublisher) { combined, id in
			combined.merge(with: getStoryById(storyId: id))
				.eraseToAnyPublisher()
		}
	}
}
