//
//  SceneDelegate.swift
//  HackerNews
//
//  Created by Mohammad Azam on 10/23/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let storyListView = StoryListView()

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: storyListView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
