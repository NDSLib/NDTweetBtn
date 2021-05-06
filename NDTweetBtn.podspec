Pod::Spec.new do |s|
  s.name         = "NDTweetBtn"
  s.version      = "1.0.0"
  s.summary      = "Twitter for iOS tweetButton like."
  s.description  = "NDTweetBtn is Twitter for iOS tweetButton like."
  s.frameworks   = "Foundation", "UIKit"
  s.homepage         = 'https://github.com/NDSLib/NDTweetBtn'
  # s.screenshots     = 'img/demo.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hirossan4049' => 'hirossan4049@gmail.com' }
  s.source           = { :git => 'https://github.com/NDSLib/NDTweetBtn.git', :tag => s.version.to_s }
  s.source_files = "NDTweetBtn/*"

  s.platform     = :ios, '8.0'
  s.requires_arc = true

end
