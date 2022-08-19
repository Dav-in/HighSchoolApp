//
//  ContentView.swift
//  Shared
//
//  Created by Davin Henrik on 3/24/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.courses, id: \.self) { course in
                    HStack {
                        Text("\(course.schoolName)")
                            .bold()
                    }
                    .padding(3)
                }
            }
            .navigationTitle("High Schools")
            .onAppear {
                viewModel.apiCall()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
