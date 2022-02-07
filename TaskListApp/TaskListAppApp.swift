//
//  TaskListAppApp.swift
//  TaskListApp
//
//  Created by Alex Kulish on 27.01.2022.
//

import SwiftUI
import Firebase

@main
struct TaskListAppApp: App {
    
//    init() {
//        FirebaseApp.configure()
//      }
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    Auth.auth().signInAnonymously()
    return true
  }
}
