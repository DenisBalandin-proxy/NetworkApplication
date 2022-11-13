//
//  NetworkManager.swift
//  NetworkApplication
//
//  Created by Denis on 2022/11/08.
//

import Foundation
import Alamofire

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
    
    func fetchCOVIDStatistics(
        from url: String,
        completion: @escaping(Result<Coronavirus, AFError>) -> Void) {
            AF.request(url)
                .validate()
                .responseJSON { dataResponse in
                    switch dataResponse.result {
                    case .success(let value):
                        let covid = Coronavirus.getCOVIDStatistics(from: value)
                        completion(.success(covid))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }
}
