executable_name = "IBSetupConsole.exe"
file_name = File.join(Chef::Config[:file_cache_path], executable_name)
log "#{file_name}"

def GetInstaller(file_name, source_url)
  remote_file file_name do
    source source_url
    action :create
  end
end

if node[:incredibuild][:install] then
  GetInstaller(file_name, node["incredibuild"]["url"])
  if File.exist?(file_name) then
    command = [file_name, "/install"]
    if (node["incredibuild"]["install"]["installdir"]) then
        command << "/INSTALLDIR=" + "#{node["incredibuild"]["install"]["installdir"]}"
    end
    if (node["incredibuild"]["install"]["coordinator"]) then
        command << "/COORDINATOR=" + "#{node["incredibuild"]["install"]["coordinator"]}"
    end
    execute "Install Incredibuild" do
      command command.join(" ")
      cwd Chef::Config[:file_cache_path]
      live_stream true
    end
  end
end

if node[:incredibuild][:uninstall] then
  GetInstaller(file_name, node["incredibuild"]["url"])
  log "Uninstalling Incredibuild"
  execute "Uninstall Incredibuild" do
    command file_name + " /uninstall"
    cwd Chef::Config[:file_cache_path]
    live_stream true
  end
end

if node[:incredibuild][:repair] then
  GetInstaller(file_name, node["incredibuild"]["url"])
  log "Repairing Incredibuild"
  execute "update incredibuild" do
    command file_name + " /repair"
    cwd Chef::Config[:file_cache_path]
    live_stream true
  end
end

if node[:incredibuild][:update] then
  GetInstaller(file_name, node["incredibuild"]["url"])
  log "Updating Incredibuild"
  execute "update incredibuild" do
    command file_name + " /update"
    cwd Chef::Config[:file_cache_path]
    live_stream true
  end
end
