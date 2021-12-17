//
//  LearnSwiftApp.swift
//  LearnSwift
//
//  Created by Cristina on 2021-12-17.
//

import SwiftUI

@main
struct LearnSwiftApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
