//
//  TodoListViewController.swift
//  ToDoList-clean architecture
//
//  Created by 오정석 on 30/5/2024.
//

import UIKit

class TodoListViewController: UIViewController {
    private var viewModel: TodoListViewModel!
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabelView()
        viewModel.fetchTodos()
    }
    
    func inject(viewModel: TodoListViewModel) {
        self.viewModel = viewModel
        self.viewModel.onTodosUpdated = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private func setupTabelView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.dataSource = self
    }
}

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell") ?? UITableViewCell(style: .default, reuseIdentifier: "TodoCell")
        let todo = viewModel.todos[indexPath.row]
        cell.textLabel?.text = todo.title
        return cell
    }
}
