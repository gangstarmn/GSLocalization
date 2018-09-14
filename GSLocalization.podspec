 Pod::Spec.new do |s|
  s.name         = "GSLocalization"
  s.version      = "0.1.5"
  s.summary      = "GSLocalization is a in app localization"
  s.description  = <<-DESC
                    In app localization. You can add it your app setting and use your bundle in localized string files
                   DESC
  s.homepage     = "https://github.com/gangstarmn/GSLocalization"
  s.license      = "MIT"
  s.author             = { "Gantulga" => "gangstarmn@gmail.com" }
  s.platform = :ios, '8.0'
  s.source = { :git => 'https://github.com/gangstarmn/GSLocalization.git', :tag => "#{s.version}" }
  
  s.source_files = "GSLocalization/**/*.{h,m}"
  
  s.framework = 'UIKit'
  s.requires_arc = true
  s.dependency 'ATLog'
  s.dependency 'GSLog'

  end