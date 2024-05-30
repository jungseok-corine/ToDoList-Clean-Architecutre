//
//  TodoListViewModel.swift
//  ToDoList-clean architecture
//
//  Created by 오정석 on 30/5/2024.
//

import Foundation

class TodoListViewModel {
    private let useCase: TodoUseCase
    private(set) var todos: [Todo] = []
    var onTodosUpdated: (() -> Void)?
    
    init(useCase: TodoUseCase) {
        self.useCase = useCase
    }
    
    func fetchTodos() {
        useCase.fetchTodos { [weak self] result in
            switch result {
            case .success(let todos):
                self?.todos = todos
                self?.onTodosUpdated?()
            case .failure(let error):
                print("Error fetching todos: \(error)")
            }
        }
    }
}
