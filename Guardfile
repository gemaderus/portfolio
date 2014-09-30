guard :jammit, :package_on_start => true, :output_folder => "public/assets/" do
  watch(%r{^public/javascripts/(.*)\.js$})
  watch(%r{^public/stylesheets/(.*)\.css$})
end

guard 'livereload', :grace_period => 0.5 do
  watch(%r{^app\.rb})
  watch(%r{views/.+\.(erb|haml|slim)$})
  watch(%r{public/.+\.(css|js|html)})
end