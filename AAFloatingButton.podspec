Pod::Spec.new do |s|
    s.name             = 'AAFloatingButton'
    s.version          = '1.2'
    s.summary          = 'AAFloatingButton is floating action button component of material design for iOS.'
    s.description      = <<-DESC
    AAFloatingButton is floating action button component of material design for iOS. It has ripple effect same as per the material design.
    DESC
    
    s.homepage         = 'https://github.com/EngrAhsanAli/AAFloatingButton'
    s.screenshots     = 'https://raw.githubusercontent.com/EngrAhsanAli/AAFloatingButton/master/Screenshots/AAFloatingButton.png'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'EngrAhsanAli' => 'hafiz.m.ahsan.ali@gmail.com' }
    s.source           = { :git => 'https://github.com/EngrAhsanAli/AAFloatingButton.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '8.0'

    s.source_files = 'AAFloatingButton/Classes/**/*'
    
end
