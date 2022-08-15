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
    
    let id: UUID
    
    var index: Int {
        viewModel.activities.firstIndex { $0.id == id } ?? 0
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text(viewModel.activities[index].title)
                    .font(.largeTitle.bold())
                
                Text(viewModel.activities[index].description)
                
                HStack {
                    Text("Completion(s): \(viewModel.activities[index].completion)")
                        .font(.headline.bold())
                        .padding(.vertical)
                    
                    Spacer()
                    
                    CustomButton(title: "Increment") {
                        incrementCompletion()
                        dismiss()
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Activity completion(s)")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func incrementCompletion() {
        viewModel.activities[index].completion += 1
    }
}

struct ActivityDetail_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetail(viewModel: ViewModel.shared, id: UUID())
    }
}
