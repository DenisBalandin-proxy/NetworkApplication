//
//  ViewController.swift
//  NetworkApplication
//
//  Created by Denis on 2022/11/04.
//

import UIKit

enum Links: String {
    case covidURL = "https://api.covid19api.com/summary"
}

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCOVIDStatistics()
    }
    
    private func fetchCOVIDStatistics() {
        guard let url = URL(string: Links.covidURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            let decoder = JSONDecoder()
            do {
                let covid = try decoder.decode(Coronavirus.self, from: data)
                print(covid)
            }
            catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
