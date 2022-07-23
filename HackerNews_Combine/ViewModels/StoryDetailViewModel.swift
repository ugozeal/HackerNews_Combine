//
//  StoryDetailViewModel.swift
//  HackerNews_Combine
//
//  Created by David Okonkwo on 23/07/2022.
//

import Foundation
import Combine

class StoryDetailViewModel: ObservableObject {
	private var cancellable: AnyCancellable?
	
	@Published private var story = Story.placeholder()
	
	init() {
	}
	
	func fetchStoryDetails(storyId: Int) {
		print("Fetching")
		cancellable = Webservice().getStoryById(storyId: storyId)
			.catch({ _ in Just(Story.placeholder())})
			.sink { _  in } receiveValue: { story in
				self.story = story
			}
	}
}

extension StoryDetailViewModel {
	
	var title: String {
		return self.story.title
	}
	
	var url: String {
		return self.story.url
	}
}
