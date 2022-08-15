//
//  ViewModel.swift
//  Habit-Tracking
//
//  Created by FABRICIO ALVARENGA on 15/08/22.
//

import Foundation

struct ActivityItem: Codable, Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var completion: Int
}

final class ViewModel: ObservableObject {
    @Published var activities = [ActivityItem]()
    
    static var shared = ViewModel()
}
