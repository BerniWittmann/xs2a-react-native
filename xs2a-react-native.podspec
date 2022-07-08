require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "xs2a-react-native"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => "12.0" }
  s.source       = { :git => "https://github.com/FinTecSystems/xs2a-react-native.git", :tag => "#{s.version}" }

  s.dependency 	 'XS2AiOS', '1.7.1'

  s.source_files = "ios/**/*.{h,m,mm,swift}"

  s.dependency "React-Core"
end
