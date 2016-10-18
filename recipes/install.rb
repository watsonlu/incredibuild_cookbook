executable_name = "IBSetupConsole.exe"
file_name = File.join(Chef::Config[:file_cache_path], executable_name)

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
        command << "/INSTALLDIR=#{node["incredibuild"]["install"]["installdir"]}"
    end
    if (node["incredibuild"]["install"]["coordinator"]) then
        command << "/COORDINATOR=#{node["incredibuild"]["install"]["coordinator"]}"
    end
    execute "Install Incredibuild" do
      command command.join(" ")
      cwd Chef::Config[:file_cache_path]
      live_stream true
    end
  end
end