//
//  NetworkManager.swift
//  NetworkApplication
//
//  Created by Denis on 2022/11/08.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

enum Link: String {
    case covidURL = "https://api.covid19api.com/summary"
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCOVIDStatistics(from url: String, completion: @escaping (Result<Coronavirus, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let statistics = try JSONDecoder().decode(Coronavirus.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(statistics))
                }
            }
            catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
