//
//  TodoRepository.swift
//  ToDoList-clean architecture
//
//  Created by 오정석 on 30/5/2024.
//

import Foundation

protocol TodoRepository {
    func fetchTodos(completion: @escaping(Result<[Todo], Error>) -> Void)
}
