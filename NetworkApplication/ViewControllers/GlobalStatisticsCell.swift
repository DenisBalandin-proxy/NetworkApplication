//
//  GlobalStatisticsCell.swift
//  NetworkApplication
//
//  Created by Denis on 2022/11/08.
//

import Foundation
import UIKit

final class GlobalStatisticsCell: UICollectionViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var statistics: UILabel!
    
    typealias currentCell = Information.CodingKeys
    
    func fetchCOVIDStatistics(from url: String, cell: currentCell) {
        title.text = cell.rawValue
        
        NetworkManager.shared.fetchCOVIDStatistics(from: url) { [weak self] result in
            switch result {
            case .success(let coronavirus):
                    switch cell {
                    case .newConfirmed:
                        self?.statistics.text = String(coronavirus.global.newConfirmed)
                    case .totalConfirmed:
                        self?.statistics.text = String(coronavirus.global.totalConfirmed)
                    case .newDeaths:
                        self?.statistics.text = String(coronavirus.global.newDeaths)
                    case .totalDeaths:
                        self?.statistics.text = String(coronavirus.global.totalDeaths)
                    case .newRecovered:
                        self?.statistics.text = String(coronavirus.global.newRecovered)
                    case .totalRecovered:
                        self?.statistics.text = String(coronavirus.global.totalRecovered)
                    }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
