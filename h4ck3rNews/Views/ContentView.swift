//
//  ContentView.swift
//  h4ck3rNews
//
//  Created by Nguyen NGO on 20/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    let url = "http://hn.algolia.com/api/v1/search?tags=front_page"
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                            .padding(.trailing)
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("h4ck3r NEWS")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            do {
                try self.networkManager.fetchData(url)
            } catch {
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
