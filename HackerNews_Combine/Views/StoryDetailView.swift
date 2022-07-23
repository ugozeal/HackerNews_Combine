//
//  StoryDetailView.swift
//  HackerNews_Combine
//
//  Created by David Okonkwo on 23/07/2022.
//

import SwiftUI

struct StoryDetailView: View {
	
	@ObservedObject private var storyDetailVM: StoryDetailViewModel
	var storyId: Int
	
	init(storyId: Int) {
		self.storyId = storyId
		self.storyDetailVM = StoryDetailViewModel()
	}
    var body: some View {
		VStack {
			WebView(url: storyDetailVM.url)
		}.onAppear{
			storyDetailVM.fetchStoryDetails(storyId: storyId)
		}
    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
		StoryDetailView(storyId: 8863)
    }
}
