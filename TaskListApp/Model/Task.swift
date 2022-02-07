//
//  Task.swift
//  TaskListApp
//
//  Created by Alex Kulish on 27.01.2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var completed: Bool
    @ServerTimestamp var createdTime: Timestamp?
}

#if DEBUG

let testDataTasks = [
    Task(title: "Implement the UI", completed: true),
    Task(title: "Connect to Firebase", completed: false),
    Task(title: "?????", completed: false),
    Task(title: "Profit!!!", completed: false)
]

#endif
