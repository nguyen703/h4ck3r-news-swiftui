//
//  NetworkManager.swift
//  h4ck3rNews
//
//  Created by Nguyen NGO on 21/04/2022.
//

import Foundation
import SwiftUI

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData(_ urlString: String) throws {
        
        guard let url = URL(string: urlString) else {
            throw NetworkManagerError.urlIsEmpty
        }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let results = try decoder.decode(Results.self, from: safeData)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                    } catch {
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }
    
    enum NetworkManagerError: Error {
        case urlIsEmpty
    }
}
