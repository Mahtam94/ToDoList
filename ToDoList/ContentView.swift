//
//  ContentView.swift
//  ToDoList
//
//  Created by Mahta Moezzi on 16/03/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var newTaskTitle: String = ""
    
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    TextField("Enter new task", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        guard !newTaskTitle.isEmpty else {return}
                        viewModel.addTask(title: newTaskTitle)
                        newTaskTitle = ""
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.leading, 4)
                }
                .padding()
                
                List{
                    ForEach(viewModel.tasks) {task in
                        HStack{
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isCompleted ? .green : .gray)
                            
                            Text(task.title)
                                .strikethrough(task.isCompleted, color: .gray)
                                .foregroundColor(task.isCompleted ? .gray : .primary)
                            
                        }
                        .onTapGesture {
                            viewModel.toggleTaskCompletion(task)
                        }
                    }
                    
                    .onDelete(perform: viewModel.deleteTask)
                        
                }
            }
            
            .navigationTitle("My To_Do List")
        }
    }
    
}

#Preview {
    ContentView()
}
