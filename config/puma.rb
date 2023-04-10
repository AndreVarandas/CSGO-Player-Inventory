# config/puma.rb

# Puma can serve each request in a thread from an internal thread pool.
workers Integer(ENV['WEB_CONCURRENCY'] || 2)

# Min and Max threads per worker
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
port        ENV['PORT']      || 3000

# Specifies the `environment` that Puma will run in.
environment ENV['RACK_ENV']  || 'development'

# Specifies the app directory
app_dir = File.expand_path("../..", __FILE__)
directory app_dir

pidfile "#{app_dir}/tmp/pids/puma.pid"
state_path "#{app_dir}/tmp/pids/puma.state"

stdout_redirect "#{app_dir}/log/puma.stdout.log", "#{app_dir}/log/puma.stderr.log", true

preload_app!


on_worker_boot do
  # Specific cluster worker boots
end

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
