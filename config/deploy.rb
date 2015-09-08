require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
# require 'mina/rbenv'

set :rails_env, 'production'

set :term_mode,  nil
set :port,       '22'
set :domain,     '31.220.7.207'
set :user,       'relative'
set :deploy_to,  "/home/relative/www-apps/mina-sample/#{rails_env}"
set :app_path,   "#{deploy_to}/#{current_path}"
set :repository, 'https://github.com/lampr/rails-sample.git'
set :branch,     'master'

set :rvm_path,   '/home/relative/.rvm/scripts/rvm'
set :bundle_bin, '/home/relative/.rvm/wrappers/ruby-2.2.1@global/bundle'


task :environment do
  # invoke :'rvm:load'
  invole :'rvm:use[ruby-2.2.1]'
end

task deploy: :environment do
  deploy do
    invoke :'git:clone'
    invoke :'bundle:install'
  end
end
