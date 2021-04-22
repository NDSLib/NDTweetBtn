Pod::Spec.new do |s|
  s.name         = "NDTweetBtn"
  s.version      = "1.0.0"
  s.summary      = "NDTweetBtn!"
  s.description  = "NDTweetBtn!?"
  s.frameworks   = "Foundation", "UIKit"
  s.homepage         = 'https://github.com/NDSLib/NDTweetBtn'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hirossan4049' => 'hirossan4049@gmail.com' }
  s.source           = { :git => 'https://github.com/NDSLib/NDTweetBtn.git', :tag => s.version.to_s }
  s.source_files = "NDTweetBtn/*"
end
