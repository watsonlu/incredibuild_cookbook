executable_name = "IBSetupConsole.exe"
file_name = File.join(Chef::Config[:file_cache_path], executable_name)

remote_file file_name do
    source source_url
    action :create
end

if File.exist?(file_name) then
    command = [file_name, "/install"]
    if (node["incredibuild"]["install"]["installdir"]) then
        command << "/INSTALLDIR=#{node["incredibuild"]["install"]["installdir"]}"
    end
    command << "/COORDINATOR=#{node["incredibuild"]["install"]["coordinator"]}"
    execute "Install Incredibuild" do
        command command.join(" ")
        cwd Chef::Config[:file_cache_path]
        live_stream true
    end
end