//
//  Task.swift
//  ToDoList
//
//  Created by Mahta Moezzi on 26/03/2025.
//

import Foundation
struct Task: Identifiable, Codable {
    let id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
}


