//
//  ViewModel.swift
//  SwiftUIAPICalls
//
//  Created by Davin Henrik on 3/24/22.
//
import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var courses: [Course] = []

    func apiCall() {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data, error == nil else {
                return
        }
            
            do {
                let courses = try JSONDecoder().decode([Course].self,
                                                       from: data   )
                DispatchQueue.main.async {
                    self?.courses = courses
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
