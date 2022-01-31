//
//  StoryListViewModel.swift
//  HackerNews
//
//  Created by Mohammad Azam on 10/23/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Combine
import Foundation

class StoryListViewModel: ObservableObject {
    @Published var stories = [StoryViewModel]()
    private var cancellable: AnyCancellable?
    
    init() {
        self.fetchTopStories()
    }
    
    private func fetchTopStories() {
        self.cancellable = Webservice().getAllTopStories().map { stories in
            stories.map { StoryViewModel(story: $0) }
        }.sink(receiveCompletion: { _ in }, receiveValue: { storyViewModels in
            self.stories = storyViewModels
        })
    }
}

struct StoryViewModel {
    let story: Story
    
    var id: Int {
        self.story.id
    }
    
    var title: String {
        self.story.title
    }
    
    var url: String {
        self.story.url
    }
}
