Pod::Spec.new do |s|
  s.name             = '${POD_NAME}'
  s.version          = '0.1.0'
  s.summary          = 'A short description of ${POD_NAME}.'

  s.homepage         = 'https://github.com/AhmedOsman00/${MODULE_TYPE}'
  s.author           = { '${USER_NAME}' => '${USER_EMAIL}' }
  s.source           = { :git => 'https://github.com/AhmedOsman00/${MODULE_TYPE}.git'}

  s.ios.deployment_target = '11.4'

  s.source_files = 'Sources/**/*.swift'

  s.test_spec 'Tests' do |ts|
    ts.source_files = 'Tests/**/*.swift'    
    # ts.dependency 'OCMock', '~> 3.3'
    # ts.resources = 'Tests/Assets/*.png'
  end
  
  # s.resource_bundles = {
  #   '${POD_NAME}' => ['Assets/*.png']
  # }

  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
