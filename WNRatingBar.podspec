Pod::Spec.new do |s|
 s.name         = "WNRatingBar"
 s.version      = "1.0.0"
 s.summary      = "swift 五星评分器"
 s.homepage     = "https://github.com/NinoWang/WNRatingBar"
 s.license      = "MIT"
 s.author       = { "NinoWang" => "ninowang@aliyun.com" }
 s.source       = { :git => "https://github.com/NinoWang/WNRatingBar.git", :tag => s.version }
 s.source_files  ="WNRatingBar", "WNRatingBar/**/*.swift"

 s.ios.deployment_target = '8.0'
end
