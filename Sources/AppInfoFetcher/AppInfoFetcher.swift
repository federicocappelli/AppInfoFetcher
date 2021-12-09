//
//  AppInfoFetcher.swift
//  AppInfoFetcher
//
//  Created by Federico Cappelli on 14/01/2019.
//
// https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/#lookup

import Foundation

public enum AppInfoFetcherError: Error {
    case invalidBundleIdentifier
    case invalidResponse
}

public final class AppInfoFetcher {
    
    var session: URLSession
    lazy var defaultCountryCode: String = {
        guard let isoCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String else {
            return "US"
        }
        return isoCode
    }()
    
    public init(useCache: Bool) {
        let config = URLSessionConfiguration.default
        if useCache {
            config.requestCachePolicy = .useProtocolCachePolicy
            config.urlCache = URLCache.shared
        } else {
            config.requestCachePolicy = .reloadIgnoringLocalCacheData
            config.urlCache = nil
        }

        session = URLSession.init(configuration: config)
    }

    public func fetchInfo(bundleIdentifier: String, countryCode: String? = nil, completionHandler: @escaping (Result<[AppInfo]?, Error>) -> Void ) {

        let iso639_1 = countryCode ?? self.defaultCountryCode
        guard let url = AppStoreConnectAPIURL(bundleID: bundleIdentifier, countryCode: iso639_1).url else {
            completionHandler(.failure(AppInfoFetcherError.invalidBundleIdentifier))
            return
        }

        let task = lookupResultTask(with: url) { response in
            switch response {
            case .success(let result):
                guard let apps = result?.appInfo as [AppInfo]? else {
                    completionHandler(.failure(AppInfoFetcherError.invalidResponse))
                    return
                }
                completionHandler(.success(apps))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
        task.resume()
    }

    func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (Result<T?, Error>) -> Void) -> URLSessionDataTask {
        return session.dataTask(with: url) { data, response, error in
            if let error = error {
                completionHandler(.failure(error))
            }
            
            guard let data = data else {
                completionHandler(.failure(AppInfoFetcherError.invalidResponse))
                return
            }
            
            let result: T?
            do {
                result = try newJSONDecoder().decode(T.self, from: data)
            } catch {
                let jsonString = String(data: data, encoding: .utf8)
                print("Error parsing: \(String(describing: jsonString)) \n \(error).")
                completionHandler(.failure(error))
                return
            }

            completionHandler(.success(result))
        }
    }

    func lookupResultTask(with url: URL, completionHandler: @escaping (Result<LookupResult?, Error>) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
