//
//  TaskCellViewModel.swift
//  TaskListApp
//
//  Created by Alex Kulish on 28.01.2022.
//

import Foundation
import Combine

class TaskCellViewModel: ObservableObject, Identifiable {
    @Published var task: Task
    @Published var completionStateIconName = ""
    private var cancellables = Set<AnyCancellable>()
    var id = ""
    
    init(task: Task) {
        self.task = task
        
        $task
            .map { task in
                task.completed ? "checkmark.cirle.fill" : "circle"
            }
            .assign(to: \.completionStateIconName, on: self)
            .store(in: &cancellables)
        
        $task
            .map { task in
                task.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
