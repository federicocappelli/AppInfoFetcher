//
//  AppCardView.swift
//  ItunesAppLookup_Example
//
//  Created by Federico Cappelli on 11/01/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import AppInfoFetcher

class AppCardView: UIView {

    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var appBundleIDLabel: UILabel!
    @IBOutlet weak var itunesButton: UIButton!
    @IBOutlet weak var appInfoTextView: UITextView!
    
    var appInfo: AppInfo?
    
    override func awakeFromNib() {
        appImageView.layer.cornerRadius = 8.0
        appImageView.clipsToBounds = true
        
        layer.cornerRadius = 8.0
        clipsToBounds = true
    }
    
    @IBAction func ItunesButtonHandler(_ sender: Any) {
        guard let urlString = appInfo?.trackViewURL,
            let url = URL(string: urlString) else {
                return
        }

        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    func fillWith(appInfo: AppInfo?) {
        self.appInfo = appInfo
        guard let appInfo = appInfo else {
            configurEmpty()
            return
        }
        
        appNameLabel.text = appInfo.trackCensoredName
        appBundleIDLabel.text = appInfo.bundleID
        itunesButton.isHidden = appInfo.trackViewURL == nil
        let prettyPrintedJson = try? appInfo.prettyJsonString()
        appInfoTextView.text = prettyPrintedJson
    }
    
    func configurEmpty() {
        appNameLabel.text = "No results"
        appBundleIDLabel.text = "-"
        itunesButton.isHidden = true
        appInfoTextView.text = "-"
    }
    
    class func instanceFromNib() -> AppCardView {
        return Bundle.main.loadNibNamed("AppCardView", owner: nil, options: nil)?.first as! AppCardView
    }
}
