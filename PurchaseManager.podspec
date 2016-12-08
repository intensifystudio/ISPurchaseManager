#
# Be sure to run `pod lib lint PurchaseManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PurchaseManager'
  s.version          = '0.1.3'
  s.summary          = 'Wrapper for StoreKit framework'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Wrapper for StoreKit framework to easily find, purchase, restore products.
                       DESC

  s.homepage         = 'https://ziad_tamim@bitbucket.org/intensifystudio/purchasemanager.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ziad Tamim' => 'tamim.ziad@gmail.com' }
  s.source           = { :git => 'https://ziad_tamim@bitbucket.org/intensifystudio/purchasemanager.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'PurchaseManager/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PurchaseManager' => ['PurchaseManager/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'StoreKit'
  s.dependency 'Bolts-Swift', '~> 1.3'
end
