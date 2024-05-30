//
//  TodoRepositoryImpl.swift
//  ToDoList-clean architecture
//
//  Created by 오정석 on 30/5/2024.
//

import Foundation


class TodoRepositoryImpl: TodoRepository {
    func fetchTodos(comlpetion: @escaping (Result<[Todo], Error>) -> Void) {
        let todos = [
        Todo(id: 1, title: "Buy groceries", isCompleted: false)
        Todo(id: 2, title: "Walk the dog", isCompleted: true)
        ]
        completion(.success(todos))
    }
}
