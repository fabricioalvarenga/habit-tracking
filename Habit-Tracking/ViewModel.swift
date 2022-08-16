//
//  ViewModel.swift
//  Habit-Tracking
//
//  Created by FABRICIO ALVARENGA on 15/08/22.
//

import Foundation

struct ActivityItem: Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var completion: Int
}

final class ViewModel: ObservableObject {
    @Published var activities = [ActivityItem]() {
        didSet {
            if let data = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(data, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let savedActivities = UserDefaults.standard.data(forKey: "Activities") {
            if let decodedActivities = try? JSONDecoder().decode([ActivityItem].self, from: savedActivities) {
                activities = decodedActivities
                return
            }
        }
        
        activities = []
    }
}
