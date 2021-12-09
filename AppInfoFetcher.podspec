#
# Be sure to run `pod lib lint ItunesAppLookup.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AppInfoFetcher'
  s.version          = '0.1.0'
  s.summary          = 'App store connect info fetcher for iOS apps'

  s.description      = <<-DESC
Given a bundle identifier this utility gets all the app's metadata from App store connect and parse them in a nice and complete model.
                       DESC

  s.homepage         = 'https://github.com/federicocappelli/AppInfoFetcher'
  s.screenshots      = 'https://github.com/federicocappelli/AppInfoFetcher/blob/master/Screenshots/screenshot1.png?raw=true'
  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author           = { 'Federico Cappelli' => 'https://github.com/federicocappelli' }
  s.source           = { :git => 'https://github.com/federicocappelli/AppInfoFetcher.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/federicokappe'
  s.ios.deployment_target = '9.0'
  s.macos.deployment_target = '10.12'
  s.swift_version = '5.0'
  s.source_files = 'Sources/AppInfoFetcher/**/*'
  
end
