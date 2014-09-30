STDOUT.sync = true

require 'bundler'
Bundler.require

begin
  require 'rack-livereload'
  use Rack::LiveReload
rescue LoadError
  # gem not installed
end

ENV['ENV'] = ENV['RACK_ENV'] ||= 'development'
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

if ENV['RACK_ENV'] == 'production'
  use Rack::Deflater
  use Rack::StaticCache, :urls => ['/assets', '/images'], :root => 'public'
end

use Rack::Static, :urls => ['/assets', '/images'], :root => 'public'

require 'sinatra/content_for'
require './app'
run App.new