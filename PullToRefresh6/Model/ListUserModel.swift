//
//  ListUserModel.swift
//  PullToRefresh6
//
//  Created by Dang Duy Cuong on 2/26/21.
//  Copyright © 2021 duycuong. All rights reserved.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let listUserModel = try? newJSONDecoder().decode(ListUserModel.self, from: jsonData)

import Foundation

// MARK: - ListUserModel
struct ListUserModel: Codable {
    let page, perPage, total, totalPages: Int
    let data: [Datum]
    let support: Support

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}

// MARK: - Datum
struct Datum: Codable {
    var id: Int?
    var email, firstName, lastName: String?
    var avatar: String?

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

// MARK: - Support
struct Support: Codable {
    let url: String
    let text: String
}
