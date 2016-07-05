use_frameworks!

abstract_target 'CocoaPods' do
  pod 'DATAStack', git: 'git@github.com:3lvis/DATAStack.git', branch: 'feature/swift-3'
    
  target 'Tests' do
  end
end

post_install do |installer|
  puts "Set Swift version to 3.0"
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end

  puts "Add code signing to pods"
  installer.pods_project.build_configurations.each do |build_configuration|
    build_configuration.build_settings['PROVISIONING_PROFILE_SPECIFIER'] = "#{ENV["PROVISIONING_PROFILE_TEAM_ID"]}"
  end
end
    