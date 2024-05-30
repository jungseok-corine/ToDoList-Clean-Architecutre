//
//  TodoUseCase.swift
//  ToDoList-clean architecture
//
//  Created by 오정석 on 30/5/2024.
//

import Foundation

protocol TodoUseCase {
    func fetchTodos(completion: @escaping (Result<[Todo], Error>) -> Void)
}

class TodoUseCaseImpl: TodoUseCase {
    private let repository: TodoRepository
    
    init(repository: TodoRepository) {
        self.repository = repository
    }
    
    func fetchTodos(completion: @escaping (Result<[Todo], any Error>) -> Void) {
        repository.fetchTodos(completion: completion)
    }
}
