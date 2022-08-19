//
//  URLImageView.swift
//  SwiftUIAPICalls
//
//  Created by Davin Henrik on 3/24/22.
//

import SwiftUI


struct URLImageView: View {
    
    let urlString: String
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 70)
                .background(Color.gray)
        }
        else {
            Image(systemName: "video")
                .frame(width: 130, height: 70)
                .background(Color.gray)
                .onAppear {
                    getData()
                }
        }
    }
        private func getData() {
            guard let url = URL(string: urlString) else {
                return
            }
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                self.data = data
            }
            task.resume()
        }
    }


struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(urlString: "")
    }
}
