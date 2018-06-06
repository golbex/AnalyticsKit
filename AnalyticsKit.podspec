Pod::Spec.new do |s|
  s.name         = "AnalyticsKit"
  s.version      = "2.1.2"

  s.summary      = "Analytics framework for iOS"

  s.description  = <<-DESC
                      The goal of AnalyticsKit is to provide a consistent API for analytics regardless of which analytics provider you're using behind the scenes.

                      The benefit of using AnalyticsKit is that if you decide to start using a new analytics provider, or add an additional one, you need to write/change much less code!

                      AnalyticsKit works both in ARC based projects and non-ARC projects.
                  DESC

  s.homepage     = "https://github.com/twobitlabs/AnalyticsKit"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.authors      = { "Two Bit Labs" => "", "Todd Huss" => "", "Susan Detwiler" => "", "Christopher Pickslay" => "", "Zac Shenker" => "", "Sinnerschrader Mobile" => "" }



  s.platform     = :ios, '8.4'
  s.source       = { :git => "https://github.com/twobitlabs/AnalyticsKit.git", :tag => s.version.to_s }
  s.requires_arc = false

  s.subspec 'Core' do |core|
    core.source_files  = 'AnalyticsKit.swift', 'AnalyticsKitEvent.swift', 'AnalyticsKitDebugProvider.swift', 'AnalyticsKitUnitTestProvider.swift', 'AnalyticsKit/AnalyticsKit/AnalyticsKitTimedEventHelper.swift'
  end

 
  s.subspec 'Crashlytics' do |c|
    c.source_files = 'Providers/Crashlytics/AnalyticsKitCrashlyticsProvider.swift'
    c.frameworks = 'Crashlytics', 'Security', 'SystemConfiguration'
    c.libraries = 'c++', 'z'
    c.dependency 'Crashlytics'
    c.dependency 'AnalyticsKit/Core'
    c.pod_target_xcconfig = {
      'FRAMEWORK_SEARCH_PATHS' => '$(inherited) $(PODS_ROOT)/Crashlytics/iOS'
      # 'OTHER_LDFLAGS'          => '$(inherited) -undefined dynamic_lookup'
    }
  end

  

  s.subspec 'GoogleAnalytics' do |g|
    g.source_files = 'Providers/Google Analytics/AnalyticsKitGoogleAnalyticsProvider.swift'
    g.dependency 'GoogleAnalytics'
    g.dependency 'AnalyticsKit/Core'
  end

  

end
