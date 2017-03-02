executable_name = 'IBSetupConsole.exe'
file_name = File.join(Chef::Config[:file_cache_path], executable_name)

remote_file file_name do
  only_if { node['incredibuild'].attribute?['url'] }
  source source_url
  action :create
end

command = [file_name, '/install"', "/COORDINATOR=#{node['incredibuild']['install']['coordinator']}"]
if node['incredibuild']['install']['installdir']
  command << "/INSTALLDIR=#{node['incredibuild']['install']['installdir']}"
end

execute 'Install Incredibuild' do
  only_if { File.exist?(file_name) }
  command command.join(' ')
  cwd Chef::Config[:file_cache_path]
  live_stream true
end
