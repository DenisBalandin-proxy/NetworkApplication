//
//  ViewController.swift
//  NetworkApplication
//
//  Created by Denis on 2022/11/04.
//

import UIKit

final class StatisticsViewController: UIViewController {
    
    @IBOutlet var collectionViewForStatistics: UICollectionView!
    
    let globalStatistics = Information.CodingKeys.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionViewForStatistics.dataSource = self
        self.collectionViewForStatistics.delegate = self
    }
}

extension StatisticsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        globalStatistics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as? GlobalStatisticsCell
        
        let statistics = globalStatistics[indexPath.item]
        
        switch statistics {
            
        case .newConfirmed:
            cell?.fetchCOVIDStatistics(from: Link.covidURL.rawValue, cell: statistics)
        case .totalConfirmed:
            cell?.fetchCOVIDStatistics(from: Link.covidURL.rawValue, cell: statistics)
        case .newDeaths:
            cell?.fetchCOVIDStatistics(from: Link.covidURL.rawValue, cell: statistics)
        case .totalDeaths:
            cell?.fetchCOVIDStatistics(from: Link.covidURL.rawValue, cell: statistics)
        case .newRecovered:
            cell?.fetchCOVIDStatistics(from: Link.covidURL.rawValue, cell: statistics)
        case .totalRecovered:
            cell?.fetchCOVIDStatistics(from: Link.covidURL.rawValue, cell: statistics)
        }
        
        return cell!
    }
}
