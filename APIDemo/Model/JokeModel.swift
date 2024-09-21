//
//  JokeModel.swift
//  APIDemo
//
//  Created by Hiren Masaliya on 21/09/24.
//

import Foundation

struct JokeModel: Codable {
    
    let id: Int
    let type: String
    let setup: String
    let punchline: String
}
