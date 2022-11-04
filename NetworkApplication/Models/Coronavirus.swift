//
//  Anime.swift
//  NetworkApplication
//
//  Created by Denis on 2022/11/04.
//

struct Coronavirus: Decodable {
    let Global: Information
    let Countries: [Country]
}

struct Information: Decodable {
    let NewConfirmed: Int
    let TotalConfirmed: Int
    let NewDeaths: Int
    let TotalDeaths: Int
    let NewRecovered: Int
    let TotalRecovered: Int
}

struct Country: Decodable {
    let Country: String
    let CountryCode: String
    let Slug: String
    let NewConfirmed: Int
    let TotalConfirmed: Int
    let NewDeaths: Int
    let TotalDeaths: Int
    let NewRecovered: Int
    let TotalRecovered: Int
    let Date: String
}
