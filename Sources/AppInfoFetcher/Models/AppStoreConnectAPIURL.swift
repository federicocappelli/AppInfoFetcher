//
//  File.swift
//  
//
//  Created by Federico Cappelli on 09/12/2021.
//

import Foundation

struct AppStoreConnectAPIURL {
    var bundleID: String
    var countryCode: String
    var url: URL? {
        return URL(string: "https://itunes.apple.com/lookup?country=\(countryCode)&bundleId=\(bundleID)")
    }
}
