//
//  Network.swift
//  API TEST
//
//  Created by Mohamed on 7/2/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation

class APIclass: Decodable {
     let country: String
       let cases: Int
       let todayCases: Int
       let deaths: Int
       let todayDeaths: Int
       let recovered: Int
       let active: Int
       let critical: Int
       let casesPerOneMillion: Int
       let deathsPerOneMillion: Int
       let totalTests: Int
       let testsPerOneMillion: Int
}
class DOG: Decodable {
    let message: URL
    let status: String
}
