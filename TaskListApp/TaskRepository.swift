//
//  TaskRepository.swift
//  TaskListApp
//
//  Created by Alex Kulish on 07.02.2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class TaskRepository: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var tasks = [Task]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        db.collection("tasks")
            .order(by: "createdTime")
            .addSnapshotListener { querySnapshot, error in
            if let querySnapshot = querySnapshot {
                self.tasks = querySnapshot.documents.compactMap { document in
                    do {
                        let task = try document.data(as: Task.self)
                        return task
                    } catch {
                     print(error)
                    }
                    return nil
                }
            }
        }
    }
    
    func addTask(_ task: Task) {
        do {
            let _ = try db.collection("tasks").addDocument(from: task)
        } catch {
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
    }
    
    func updateTask(_ task: Task) {
        if let taskID = task.id {
            do {
                try db.collection("tasks").document(taskID).setData(from: task)
            } catch {
                fatalError("Unable encode task: \(error.localizedDescription)")
            }
        }
        
    }
    
}

