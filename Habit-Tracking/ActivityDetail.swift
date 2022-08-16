//
//  ActivityDetail.swift
//  Habit-Tracking
//
//  Created by FABRICIO ALVARENGA on 15/08/22.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(title) {
            action()
        }
        .padding(5)
        .background(.blue)
        .foregroundColor(.white)
        .font(.body.bold())
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.blue, lineWidth: 5)
        )
    }
}

struct ActivityDetail: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ViewModel
    
    let activity: ActivityItem
    
    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading) {
                    Text(activity.title)
                        .font(.largeTitle.bold())
                    
                    Text(activity.description)
                    
                    Text("Completion(s): \(activity.completion)")
                        .font(.headline.bold())
                        .padding(.vertical)
                    
                    Spacer()
                }
            }
            .navigationTitle("Activity completion(s)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Increment") {
                    incrementCompletion()
                    dismiss()
                }
            }
        }
    }
    
    func incrementCompletion() {
        if let index = viewModel.activities.firstIndex(where: { $0 == activity }) {
            viewModel.activities[index].completion += 1
        }
    }
}

struct ActivityDetail_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ViewModel()
        let activity = ActivityItem(title: "Title", description: "Description", completion: 1)
        
        ActivityDetail(viewModel: viewModel, activity: activity)
    }
}
