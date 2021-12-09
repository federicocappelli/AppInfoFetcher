//
//  LookupResult.swift
//  AppInfoFetcher
//
//  Created by Federico Cappelli on 14/01/2019.
//

import Foundation

class LookupResult: Codable {
    let resultCount: Int?
    let appInfo: [AppInfo]?
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case appInfo = "results"
    }
    
    init(resultCount: Int?, appInfo: [AppInfo]?) {
        self.resultCount = resultCount
        self.appInfo = appInfo
    }
}

// MARK: Convenience initializers and mutators

extension LookupResult {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(LookupResult.self, from: data)
        self.init(resultCount: me.resultCount, appInfo: me.appInfo)
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
        resultCount: Int?? = nil,
        appInfo: [AppInfo]?? = nil
        ) -> LookupResult {
        return LookupResult(
            resultCount: resultCount ?? self.resultCount,
            appInfo: appInfo ?? self.appInfo
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
