//
//  ContentView.swift
//  Habit-Tracking
//
//  Created by FABRICIO ALVARENGA on 15/08/22.
//

import SwiftUI


struct ContentView: View {
    @State private var presentAddActivity = false
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.activities) { activity in
                    NavigationLink {
                        ActivityDetail(viewModel: viewModel, activity: activity)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(activity.title)
                                    .font(.headline)
                                
                                Text(activity.description)
                            }
                            
                            Spacer()
                            
                            Text("\(activity.completion)")
                        }
                    }
                }
                .onDelete(perform: removeActivity)
            }
            .navigationTitle("Habit Tracking")
            .toolbar {
                    Button {
                        presentAddActivity = true
                    } label: {
                        Image(systemName: "plus")
                    }
            }
            .sheet(isPresented: $presentAddActivity) {
                AddActivity(viewModel: viewModel)
            }
        }
    }
    
    func removeActivity(at offsets: IndexSet) {
        viewModel.activities.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
