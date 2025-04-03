//
//  TaskViewModel.swift
//  ToDoList
//
//  Created by Mahta Moezzi on 03/04/2025.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = [] {
        didSet {
            saveTasks()
    }
}
    private let taskskey = "SavedTasks"
    
    init() {
        loadTasks()
    }
    
    //Public functions
    //Add new task
    func addTask(title: String) {
        let newTask = Task(title: title)
        tasks.append(newTask)
    }
    
    //Toggle complition
    func toggleTaskCompletion(_ task: Task) {
        if let index = tasks.firstIndex(where: {$0.id == task.id}) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    //Delete task
    func deleteTask(at offsts: IndexSet){
        tasks.remove(atOffsets: offsts)
    }
    
    private func saveTasks() {
        if let encodedData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: taskskey)
        }
    }
    
    private func loadTasks () {
        if let data = UserDefaults.standard.data(forKey: taskskey),
           let decodedTasks = try? JSONDecoder().decode([Task].self, from: data) {
            tasks = decodedTasks
        }
    }
    
}
