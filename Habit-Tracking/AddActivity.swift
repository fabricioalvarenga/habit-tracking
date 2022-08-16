//
//  AddActivity.swift
//  Habit-Tracking
//
//  Created by FABRICIO ALVARENGA on 15/08/22.
//

import SwiftUI

struct AddActivity: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: ViewModel
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                
                TextField("Description", text: $description)
            }
            .navigationTitle("Add new activity")
            .toolbar {
                Button("Save") {
                    let activity = ActivityItem(title: title, description: description, completion: 0)
                    
                    viewModel.activities.append(activity)
                    
                    dismiss()
                }
            }
        }
    }
}

struct AddActivity_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ViewModel()
        
        AddActivity(viewModel: viewModel)
    }
}
