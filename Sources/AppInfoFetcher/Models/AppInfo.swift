//
//  AppInfo.swift
//  AppInfoFetcher
//
//  Created by Federico Cappelli on 14/01/2019.
//  Copyright © 2019 Federico Cappelli All rights reserved.
//

import Foundation

public final class AppInfo: Codable {
    public let artistViewURL: String?
    public let artworkUrl60, artworkUrl100: String?
    public let ipadScreenshotUrls: [JSONAny]?
    public let artworkUrl512: String?
    public let appletvScreenshotUrls: [JSONAny]?
    public let screenshotUrls: [String]?
    public let isGameCenterEnabled: Bool?
    public let advisories, supportedDevices: [String]?
    public let kind: String?
    public let features: [JSONAny]?
    public let trackCensoredName: String?
    public let trackViewURL: String?
    public let contentAdvisoryRating: String?
    public let averageUserRatingForCurrentVersion: Double?
    public let languageCodesISO2A: [String]?
    public let fileSizeBytes: String?
    public let sellerURL: String?
    public let userRatingCountForCurrentVersion: Int?
    public let trackContentRating, sellerName: String?
    public let primaryGenreID: Int?
    public let formattedPrice: String?
    public let isVppDeviceBasedLicensingEnabled: Bool?
    public let currentVersionReleaseDate: Date?
    public let currency, wrapperType, version, trackName: String?
    public let trackID, artistID: Int?
    public let artistName: String?
    public let genres: [String]?
    public let price: Double?
    public let description, bundleID: String?
    public let releaseDate: Date?
    public let primaryGenreName: String?
    public let genreIDS: [String]?
    public let minimumOSVersion, releaseNotes: String?
    public let averageUserRating: Double?
    public let userRatingCount: Int?
    
    public enum CodingKeys: String, CodingKey {
        case artistViewURL = "artistViewUrl"
        case artworkUrl60, artworkUrl100, ipadScreenshotUrls, artworkUrl512, appletvScreenshotUrls, screenshotUrls, isGameCenterEnabled, advisories, supportedDevices, kind, features, trackCensoredName
        case trackViewURL = "trackViewUrl"
        case contentAdvisoryRating, averageUserRatingForCurrentVersion, languageCodesISO2A, fileSizeBytes
        case sellerURL = "sellerUrl"
        case userRatingCountForCurrentVersion, trackContentRating, sellerName
        case primaryGenreID = "primaryGenreId"
        case formattedPrice, isVppDeviceBasedLicensingEnabled, currentVersionReleaseDate, currency, wrapperType, version, trackName
        case trackID = "trackId"
        case artistID = "artistId"
        case artistName, genres, price, description
        case bundleID = "bundleId"
        case releaseDate, primaryGenreName
        case genreIDS = "genreIds"
        case minimumOSVersion = "minimumOsVersion"
        case releaseNotes, averageUserRating, userRatingCount
    }
    
    public init(artistViewURL: String?, artworkUrl60: String?, artworkUrl100: String?, ipadScreenshotUrls: [JSONAny]?, artworkUrl512: String?, appletvScreenshotUrls: [JSONAny]?, screenshotUrls: [String]?, isGameCenterEnabled: Bool?, advisories: [String]?, supportedDevices: [String]?, kind: String?, features: [JSONAny]?, trackCensoredName: String?, trackViewURL: String?, contentAdvisoryRating: String?, averageUserRatingForCurrentVersion: Double?, languageCodesISO2A: [String]?, fileSizeBytes: String?, sellerURL: String?, userRatingCountForCurrentVersion: Int?, trackContentRating: String?, sellerName: String?, primaryGenreID: Int?, formattedPrice: String?, isVppDeviceBasedLicensingEnabled: Bool?, currentVersionReleaseDate: Date?, currency: String?, wrapperType: String?, version: String?, trackName: String?, trackID: Int?, artistID: Int?, artistName: String?, genres: [String]?, price: Double?, description: String?, bundleID: String?, releaseDate: Date?, primaryGenreName: String?, genreIDS: [String]?, minimumOSVersion: String?, releaseNotes: String?, averageUserRating: Double?, userRatingCount: Int?) {
        self.artistViewURL = artistViewURL
        self.artworkUrl60 = artworkUrl60
        self.artworkUrl100 = artworkUrl100
        self.ipadScreenshotUrls = ipadScreenshotUrls
        self.artworkUrl512 = artworkUrl512
        self.appletvScreenshotUrls = appletvScreenshotUrls
        self.screenshotUrls = screenshotUrls
        self.isGameCenterEnabled = isGameCenterEnabled
        self.advisories = advisories
        self.supportedDevices = supportedDevices
        self.kind = kind
        self.features = features
        self.trackCensoredName = trackCensoredName
        self.trackViewURL = trackViewURL
        self.contentAdvisoryRating = contentAdvisoryRating
        self.averageUserRatingForCurrentVersion = averageUserRatingForCurrentVersion
        self.languageCodesISO2A = languageCodesISO2A
        self.fileSizeBytes = fileSizeBytes
        self.sellerURL = sellerURL
        self.userRatingCountForCurrentVersion = userRatingCountForCurrentVersion
        self.trackContentRating = trackContentRating
        self.sellerName = sellerName
        self.primaryGenreID = primaryGenreID
        self.formattedPrice = formattedPrice
        self.isVppDeviceBasedLicensingEnabled = isVppDeviceBasedLicensingEnabled
        self.currentVersionReleaseDate = currentVersionReleaseDate
        self.currency = currency
        self.wrapperType = wrapperType
        self.version = version
        self.trackName = trackName
        self.trackID = trackID
        self.artistID = artistID
        self.artistName = artistName
        self.genres = genres
        self.price = price
        self.description = description
        self.bundleID = bundleID
        self.releaseDate = releaseDate
        self.primaryGenreName = primaryGenreName
        self.genreIDS = genreIDS
        self.minimumOSVersion = minimumOSVersion
        self.releaseNotes = releaseNotes
        self.averageUserRating = averageUserRating
        self.userRatingCount = userRatingCount
    }
}

public extension AppInfo {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(AppInfo.self, from: data)
        self.init(artistViewURL: me.artistViewURL, artworkUrl60: me.artworkUrl60, artworkUrl100: me.artworkUrl100, ipadScreenshotUrls: me.ipadScreenshotUrls, artworkUrl512: me.artworkUrl512, appletvScreenshotUrls: me.appletvScreenshotUrls, screenshotUrls: me.screenshotUrls, isGameCenterEnabled: me.isGameCenterEnabled, advisories: me.advisories, supportedDevices: me.supportedDevices, kind: me.kind, features: me.features, trackCensoredName: me.trackCensoredName, trackViewURL: me.trackViewURL, contentAdvisoryRating: me.contentAdvisoryRating, averageUserRatingForCurrentVersion: me.averageUserRatingForCurrentVersion, languageCodesISO2A: me.languageCodesISO2A, fileSizeBytes: me.fileSizeBytes, sellerURL: me.sellerURL, userRatingCountForCurrentVersion: me.userRatingCountForCurrentVersion, trackContentRating: me.trackContentRating, sellerName: me.sellerName, primaryGenreID: me.primaryGenreID, formattedPrice: me.formattedPrice, isVppDeviceBasedLicensingEnabled: me.isVppDeviceBasedLicensingEnabled, currentVersionReleaseDate: me.currentVersionReleaseDate, currency: me.currency, wrapperType: me.wrapperType, version: me.version, trackName: me.trackName, trackID: me.trackID, artistID: me.artistID, artistName: me.artistName, genres: me.genres, price: me.price, description: me.description, bundleID: me.bundleID, releaseDate: me.releaseDate, primaryGenreName: me.primaryGenreName, genreIDS: me.genreIDS, minimumOSVersion: me.minimumOSVersion, releaseNotes: me.releaseNotes, averageUserRating: me.averageUserRating, userRatingCount: me.userRatingCount)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        artistViewURL: String?? = nil,
        artworkUrl60: String?? = nil,
        artworkUrl100: String?? = nil,
        ipadScreenshotUrls: [JSONAny]?? = nil,
        artworkUrl512: String?? = nil,
        appletvScreenshotUrls: [JSONAny]?? = nil,
        screenshotUrls: [String]?? = nil,
        isGameCenterEnabled: Bool?? = nil,
        advisories: [String]?? = nil,
        supportedDevices: [String]?? = nil,
        kind: String?? = nil,
        features: [JSONAny]?? = nil,
        trackCensoredName: String?? = nil,
        trackViewURL: String?? = nil,
        contentAdvisoryRating: String?? = nil,
        averageUserRatingForCurrentVersion: Double?? = nil,
        languageCodesISO2A: [String]?? = nil,
        fileSizeBytes: String?? = nil,
        sellerURL: String?? = nil,
        userRatingCountForCurrentVersion: Int?? = nil,
        trackContentRating: String?? = nil,
        sellerName: String?? = nil,
        primaryGenreID: Int?? = nil,
        formattedPrice: String?? = nil,
        isVppDeviceBasedLicensingEnabled: Bool?? = nil,
        currentVersionReleaseDate: Date?? = nil,
        currency: String?? = nil,
        wrapperType: String?? = nil,
        version: String?? = nil,
        trackName: String?? = nil,
        trackID: Int?? = nil,
        artistID: Int?? = nil,
        artistName: String?? = nil,
        genres: [String]?? = nil,
        price: Double?? = nil,
        description: String?? = nil,
        bundleID: String?? = nil,
        releaseDate: Date?? = nil,
        primaryGenreName: String?? = nil,
        genreIDS: [String]?? = nil,
        minimumOSVersion: String?? = nil,
        releaseNotes: String?? = nil,
        averageUserRating: Double?? = nil,
        userRatingCount: Int?? = nil
        ) -> AppInfo {
        return AppInfo(
            artistViewURL: artistViewURL ?? self.artistViewURL,
            artworkUrl60: artworkUrl60 ?? self.artworkUrl60,
            artworkUrl100: artworkUrl100 ?? self.artworkUrl100,
            ipadScreenshotUrls: ipadScreenshotUrls ?? self.ipadScreenshotUrls,
            artworkUrl512: artworkUrl512 ?? self.artworkUrl512,
            appletvScreenshotUrls: appletvScreenshotUrls ?? self.appletvScreenshotUrls,
            screenshotUrls: screenshotUrls ?? self.screenshotUrls,
            isGameCenterEnabled: isGameCenterEnabled ?? self.isGameCenterEnabled,
            advisories: advisories ?? self.advisories,
            supportedDevices: supportedDevices ?? self.supportedDevices,
            kind: kind ?? self.kind,
            features: features ?? self.features,
            trackCensoredName: trackCensoredName ?? self.trackCensoredName,
            trackViewURL: trackViewURL ?? self.trackViewURL,
            contentAdvisoryRating: contentAdvisoryRating ?? self.contentAdvisoryRating,
            averageUserRatingForCurrentVersion: averageUserRatingForCurrentVersion ?? self.averageUserRatingForCurrentVersion,
            languageCodesISO2A: languageCodesISO2A ?? self.languageCodesISO2A,
            fileSizeBytes: fileSizeBytes ?? self.fileSizeBytes,
            sellerURL: sellerURL ?? self.sellerURL,
            userRatingCountForCurrentVersion: userRatingCountForCurrentVersion ?? self.userRatingCountForCurrentVersion,
            trackContentRating: trackContentRating ?? self.trackContentRating,
            sellerName: sellerName ?? self.sellerName,
            primaryGenreID: primaryGenreID ?? self.primaryGenreID,
            formattedPrice: formattedPrice ?? self.formattedPrice,
            isVppDeviceBasedLicensingEnabled: isVppDeviceBasedLicensingEnabled ?? self.isVppDeviceBasedLicensingEnabled,
            currentVersionReleaseDate: currentVersionReleaseDate ?? self.currentVersionReleaseDate,
            currency: currency ?? self.currency,
            wrapperType: wrapperType ?? self.wrapperType,
            version: version ?? self.version,
            trackName: trackName ?? self.trackName,
            trackID: trackID ?? self.trackID,
            artistID: artistID ?? self.artistID,
            artistName: artistName ?? self.artistName,
            genres: genres ?? self.genres,
            price: price ?? self.price,
            description: description ?? self.description,
            bundleID: bundleID ?? self.bundleID,
            releaseDate: releaseDate ?? self.releaseDate,
            primaryGenreName: primaryGenreName ?? self.primaryGenreName,
            genreIDS: genreIDS ?? self.genreIDS,
            minimumOSVersion: minimumOSVersion ?? self.minimumOSVersion,
            releaseNotes: releaseNotes ?? self.releaseNotes,
            averageUserRating: averageUserRating ?? self.averageUserRating,
            userRatingCount: userRatingCount ?? self.userRatingCount
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func prettyJsonString(encoding: String.Encoding = .utf8) throws -> String? {
        guard let object = try? JSONSerialization.jsonObject(with: self.jsonData(), options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedString = NSString(data: data, encoding: encoding.rawValue) else { return nil }
        return prettyPrintedString as String //String(data: try self.jsonData(), encoding: encoding)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
