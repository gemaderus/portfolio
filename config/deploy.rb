require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'

set :domain, '146.185.183.46'
set :deploy_to, '/var/www/gemaderus-portfolio'
set :repository, 'git@github.com:gemaderus/portfolio.git'
set :branch, 'master'

set :shared_paths, ['log']

set :user, 'ubuntu'
set :port, '2222'
set :forward_agent, true

task :environment do
  invoke :'rbenv:load'
end

task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'

    to :launch do
      queue "mkdir -p #{deploy_to}/#{current_path}/tmp/"
      queue "touch #{deploy_to}/#{current_path}/tmp/restart.txt"
    end
  end
end
