Pod::Spec.new do |s|
s.name					= "CharPageControl"
s.version				= "2.0"
s.summary				= "CharPageControl is a GLYPH style for pagination written in swift."
s.homepage				= "https://github.com/indevizible/CharPageControl"
s.license				= { :type => "Apache 2.0", :file => 'LICENSE' }
s.authors				= { "Nattawut Singhchai" => "jadedragon17650@gmail.com" }

s.ios.deployment_target	= "8.0"
s.source				= { :git => "https://github.com/indevizible/CharPageControl.git", :tag => "#{s.version}"}
s.source_files 		 	= "CharPageControl/**/*.swift"
s.requires_arc			= true
end