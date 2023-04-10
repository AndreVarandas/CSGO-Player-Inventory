# config/puma.rb

workers 0
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

port        ENV['PORT']      || 3000
environment ENV['RACK_ENV']  || 'development'

app_dir = File.expand_path("../..", __FILE__)
directory app_dir

pidfile "#{app_dir}/tmp/pids/puma.pid"
state_path "#{app_dir}/tmp/pids/puma.state"

stdout_redirect "#{app_dir}/log/puma.stdout.log", "#{app_dir}/log/puma.stderr.log", true

plugin :tmp_restart
