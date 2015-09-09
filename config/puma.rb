# Change to match your CPU core count
workers 2

# Min and Max threads per worker
threads 1, 6

app_dir = File.expand_path("../..", __FILE__)
# shared_dir = "#{app_dir}/shared"

# Default to production
rails_env = ENV['RAILS_ENV'] || "production"
environment rails_env

# Set up socket location
bind "unix:/home/relative/www-apps/mina-sample/puma_process/puma.sock"

# Logging
stdout_redirect "/home/relative/www-apps/mina-sample/puma_process/logs/puma.stdout.log", "/home/relative/www-apps/mina-sample/puma_process/logs/puma.stderr.log", true

# Set master PID and state locations
pidfile "/home/relative/www-apps/mina-sample/puma_process/pids/puma.pid"
state_path "/home/relative/www-apps/mina-sample/puma_process/pids/puma.state"
activate_control_app

on_worker_boot do
  # require "active_record"
  # ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
  # ActiveRecord::Base.establish_connection(YAML.load_file("#{app_dir}/config/database.yml")[rails_env])
end