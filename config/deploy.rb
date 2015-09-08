require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'

set :rails_env, 'production'

set :term_mode,  nil
set :port,       '22'
set :domain,     '31.220.7.207'
set :user,       'relative'
set :deploy_to,  "/home/relative/www-apps/mina-sample/#{rails_env}"
set :app_path,   "#{deploy_to}/#{current_path}"
set :repository, 'https://github.com/username/mynewapp.git'
set :branch,     'master'


task :environment do
  invoke :'rbenv:load'
end

task deploy: :environment do

  deploy do
    invoke :'git:clone'
    invoke :'bundle:install'
  end
end
