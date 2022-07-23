//
//  StoryListView.swift
//  HackerNews_Combine
//
//  Created by David Okonkwo on 23/07/2022.
//

import SwiftUI

struct StoryListView: View {
	
	@ObservedObject private var storyListVM = StoryListViewModel()
	
    var body: some View {
		NavigationView {
			
			List(self.storyListVM.stories, id: \.id) { storyVM in
				NavigationLink(destination: StoryDetailView(storyId: storyVM.id)) {
					Text("\(storyVM.title)")
				}
				
			}
			
			.navigationBarTitle("Hacker News")
		}
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}
