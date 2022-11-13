//
//  Anime.swift
//  NetworkApplication
//
//  Created by Denis on 2022/11/04.
//

struct Coronavirus: Decodable {
    let global: Information
    let countries: [Country]
    
    init(value: [String: Any]) {
        global = Information(value: value["Global"] as? [String : Any] ?? [:])
        countries = value["Countries"] as? [Country] ?? []
    }
    enum CodingKeys: String, CodingKey{
        case global = "Global"
        case countries = "Countries"
    }
    
    static func getCOVIDStatistics(from value: Any) -> Coronavirus {
        guard let covidData = value as? [String: Any] else {
            return Coronavirus(value: [:])
        }
        return Coronavirus(value: covidData)
    }
}

struct Information: Decodable {
    let newConfirmed: Int
    let totalConfirmed: Int
    let newDeaths: Int
    let totalDeaths: Int
    let newRecovered: Int
    let totalRecovered: Int
    
    init(value: [String: Any]) {
        newConfirmed = value["NewConfirmed"] as? Int ?? 0
        totalConfirmed = value["TotalConfirmed"] as? Int ?? 0
        newDeaths = value["NewDeaths"] as? Int ?? 0
        totalDeaths = value["TotalDeaths"] as? Int ?? 0
        newRecovered = value["NewRecovered"] as? Int ?? 0
        totalRecovered = value["TotalRecovered"] as? Int ?? 0
    }
    
    enum CodingKeys: String, CodingKey, CaseIterable {
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
    }
    
    static func getFullStatistics(from value: Any) -> Information {
        let covidStatistics = value as? [String: Any] ?? [:]
        return Information(value: covidStatistics)
    }
}

struct Country: Decodable {
    let country: String
    let countryCode: String
    let slug: String
    let newConfirmed: Int
    let totalConfirmed: Int
    let newDeaths: Int
    let totalDeaths: Int
    let newRecovered: Int
    let totalRecovered: Int
    let date: String
    
    init(value: [String: Any]) {
        country = value["Country"] as? String ?? ""
        countryCode = value["CountryCode"] as? String ?? ""
        slug = value["Slug"] as? String ?? ""
        newConfirmed = value["NewConfirmed"] as? Int ?? 0
        totalConfirmed = value["TotalConfirmed"] as? Int ?? 0
        newDeaths = value["NewDeaths"] as? Int ?? 0
        totalDeaths = value["TotalDeaths"] as? Int ?? 0
        newRecovered = value["NewRecovered"] as? Int ?? 0
        totalRecovered = value["TotalRecovered"] as? Int ?? 0
        date = value["Date"] as? String ?? ""
    }
    
    static func getCountryStatistics(from value: Any) -> [Country] {
        guard let counties = value as? [[String: Any]] else { return [] }
        return counties.map { Country(value: $0) }
    }
    
    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case countryCode = "CountryCode"
        case slug = "Slug"
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
        case date = "Date"
    }
}
