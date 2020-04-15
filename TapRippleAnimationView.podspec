
Pod::Spec.new do |s|
  s.name         = "TapRippleAnimationView"
  s.version      = "1.0.0"
  s.summary      = "A short description of TapRippleAnimationView."
  s.description  = <<-DESC
		      - Make Ripple Effects when you tap UIView
                   DESC

  s.homepage     = "https://github.com/willy12262001/TapRippleAnimationView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "WillyChen" => "willy12262001@hotmail.com.tw" }
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/willy12262001/TapRippleAnimationView.git", :tag => "#{s.version}" }
  s.source_files  = "TapRippleAnimationView/**/*.swift"
  s.requires_arc = true

end
