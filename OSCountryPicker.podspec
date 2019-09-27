Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '9.0'
s.name = "OSCountryPicker"
s.summary = "OSCountryPicker lets a user select a country and get its realted info."
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Omeesh" => "omeeshsharma.96@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/Omeesh/OSCountryPicker"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/Omeesh/OSCountryPicker.git",
:tag => "#{s.version}" }

# 7
s.framework = "UIKit"


# 8
s.source_files = "OSCountryPicker/**/*.{swift}"


# 10
s.swift_version = "4.2"

end
