Pod::Spec.new do |spec|
  spec.name         = "TunnelKit"
  spec.version      = "1.0.0"  # Update to the correct version
  spec.summary      = "TunnelKit is a powerful and modern networking library."
  spec.homepage     = "https://github.com/tahirmahm123/TunnelKit"  # Update the URL
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { "Tahir Mahmood" => "tahirmahm123@gmail.com" }  # Update your details
  spec.platform     = :ios, "14.0"
  spec.platform     = :osx, "12.0"
  spec.platform     = :tvos, "17.0"
  spec.swift_version = "5.9"

  spec.source       = { :git => "https://github.com/yourusername/TunnelKit.git", :tag => "#{spec.version}" }  # Update the URL
  
  spec.subspec 'Core' do |ss|
    ss.source_files = 'Sources/TunnelKitCore/**/*.{swift,h,m}'
    ss.dependency 'SwiftyBeaver', '~> 1.9.0'
  end

  spec.subspec 'Manager' do |ss|
    ss.source_files = 'Sources/TunnelKitManager/**/*.{swift,h,m}'
    ss.dependency 'SwiftyBeaver', '~> 1.9.0'
  end

  spec.subspec 'OpenVPNCore' do |ss|
    ss.source_files = 'Sources/TunnelKitOpenVPNCore/**/*.{swift,h,m}'
    ss.dependency 'TunnelKit/Core'
    ss.dependency 'openssl-apple', '~> 3.2.107'
  end

  spec.subspec 'OpenVPNManager' do |ss|
    ss.source_files = 'Sources/TunnelKitOpenVPNManager/**/*.{swift,h,m}'
    ss.dependency 'TunnelKit/Manager'
    ss.dependency 'TunnelKit/OpenVPNCore'
  end

  spec.subspec 'OpenVPNProtocol' do |ss|
    ss.source_files = 'Sources/TunnelKitOpenVPNProtocol/**/*.{swift,h,m}'
    ss.dependency 'TunnelKit/OpenVPNCore'
    ss.dependency 'CTunnelKitOpenVPNProtocol'
  end

  spec.subspec 'OpenVPNAppExtension' do |ss|
    ss.source_files = 'Sources/TunnelKitOpenVPNAppExtension/**/*.{swift,h,m}'
    ss.dependency 'TunnelKit/AppExtension'
    ss.dependency 'TunnelKit/OpenVPNCore'
    ss.dependency 'TunnelKit/OpenVPNManager'
    ss.dependency 'TunnelKit/OpenVPNProtocol'
  end

  spec.subspec 'LZO' do |ss|
    ss.source_files = 'Sources/TunnelKitLZO/**/*.{swift,h,m}'
    ss.exclude_files = [
      'lib/COPYING',
      'lib/Makefile',
      'lib/README.LZO',
      'lib/testmini.c'
    ]
  end

  # Define the other core targets
  spec.subspec 'CTunnelKitCore' do |ss|
    ss.source_files = 'Sources/CTunnelKitCore/**/*.{c,h}'
  end

  spec.subspec 'CTunnelKitOpenVPNCore' do |ss|
    ss.source_files = 'Sources/CTunnelKitOpenVPNCore/**/*.{c,h}'
  end

  spec.subspec 'CTunnelKitOpenVPNProtocol' do |ss|
    ss.source_files = 'Sources/CTunnelKitOpenVPNProtocol/**/*.{c,h}'
    ss.dependency 'CTunnelKitCore'
    ss.dependency 'CTunnelKitOpenVPNCore'
    ss.dependency 'openssl-apple', '~> 3.2.107'
  end

  spec.subspec '__TunnelKitUtils' do |ss|
    ss.source_files = 'Sources/__TunnelKitUtils/**/*.{swift,h,m}'
  end

  spec.subspec 'AppExtension' do |ss|
    ss.source_files = 'Sources/TunnelKitAppExtension/**/*.{swift,h,m}'
    ss.dependency 'TunnelKit/Core'
  end
end
