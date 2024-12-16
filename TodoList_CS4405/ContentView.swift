//
//  ContentView.swift
//  TodoList_CS4405
//
//  Created by Giorgio Giannotta on 16/12/24.
//

import SwiftUI

// Define the ToDo struct
struct ToDo: Identifiable {
    let id = UUID() // Unique identifier for SwiftUI List
    let toDoId: Int
    let toDoTitle: String
    let toDoStatus: String
}

// Sample ToDo data
let sampleToDos = [
    ToDo(toDoId: 1, toDoTitle: "TestSet 1 - Day 1", toDoStatus: "completed"),
    ToDo(toDoId: 2, toDoTitle: "TestSet 2 - Day 2", toDoStatus: "completed"),
    ToDo(toDoId: 3, toDoTitle: "TestSet 1 - Day 3", toDoStatus: "pending"),
    ToDo(toDoId: 4, toDoTitle: "TestSet 2 - Day 4", toDoStatus: "completed"),
    ToDo(toDoId: 5, toDoTitle: "TestSet 1 - Day 5", toDoStatus: "completed"),
    ToDo(toDoId: 6, toDoTitle: "TestSet 2 - Day 6", toDoStatus: "pending")
]

// Function to filter completed even ToDos
func filterCompletedEvenToDos(from todos: [ToDo]) -> [ToDo] {
    return todos.filter { $0.toDoId % 2 == 0 && $0.toDoStatus.lowercased() == "completed" }
}


// ContentView
struct ContentView: View {
    @State private var todos = sampleToDos
    @State private var showFilteredOnly = false
    
    var filteredToDos: [ToDo] {
        return filterCompletedEvenToDos(from: todos)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Toggle("Show Only Completed Even ToDos", isOn: $showFilteredOnly)
                    .padding()
                
                List(showFilteredOnly ? filteredToDos : todos) { todo in
                    VStack(alignment: .leading) {
                        Text(todo.toDoTitle)
                            .font(.headline)
                        Text("Status: \(todo.toDoStatus.capitalized)")
                            .font(.subheadline)
                        Text("ID: \(todo.toDoId)")
                            .font(.caption)
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("To-Do List")
        }
    }
}

#Preview {
    ContentView()
}
