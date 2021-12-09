//
//  ViewController.swift
//  AppInfoFetcher
//
//  Created by Federico Cappelli on 01/11/2019.
//  Copyright (c) 2019 Federico Cappelli All rights reserved.
//

import UIKit
import AppInfoFetcher

class ViewController: UIViewController {
    
    let lookuper = AppInfoFetcher(useCache: false)
    @IBOutlet var bundleIDField: UITextField!
    @IBOutlet var cardsStackView: UIStackView!

    @IBAction func lookupButtonHandler(sender: AnyObject) -> Void {
        
        guard let bundleID = self.bundleIDField.text else {
            return
        }
        
        lookuper.fetchInfo(bundleIdentifier: bundleID) { result in
            switch result {
            case.success(let appsInfo):
                DispatchQueue.main.async {
                    self.show(appsInfo: appsInfo)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    fileprivate func show(appsInfo: [AppInfo]?) {
        cleanupStackView()
        guard let appsInfo = appsInfo else {
            return
        }
        
        if appsInfo.count == 0 {
            let cardView = createAppCard(withAppInfo: nil)
            cardsStackView.addArrangedSubview(cardView)
        }
        
        let appInfo = appsInfo.first //limited to the first result
        let cardView = createAppCard(withAppInfo: appInfo)
        cardsStackView.addArrangedSubview(cardView)
    }
    
    func createAppCard(withAppInfo appInfo: AppInfo?) -> AppCardView {
        let cardView = AppCardView.instanceFromNib()
        
        guard let appInfo = appInfo else {
            cardView.configurEmpty()
            return cardView
        }
        
        cardView.fillWith(appInfo: appInfo)
        //download image
        if let imageString = appInfo.artworkUrl100, let imageURL = URL(string: imageString) {
            downloadImage(from: imageURL, appCardView: cardView)
        }
        
        return cardView
    }
    
    func cleanupStackView() {
        for view in cardsStackView.arrangedSubviews {
            cardsStackView.removeArrangedSubview(view)
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL, appCardView: AppCardView) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                appCardView.appImageView.image = UIImage(data: data)
            }
        }
    }
}

