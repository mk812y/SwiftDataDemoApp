//
//  SwiftDataDemoAppApp.swift
//  SwiftDataDemoApp
//
//  Created by Михаил Куприянов on 30.10.23..
///https://medium.com/@aryanrunthala.92/swiftdata-c273f100c397

import SwiftUI
import SwiftData

@main
struct SwiftDataDemoAppApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Student.self,
            School.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                StudentListView()
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
