# Incredibuild-Cookbook

Adds basic support for installing incredibuild agents


##Requirements

1. You must have created an automated installer from your incredibuild installer. Run the installer, then click "Create Automated Installer"
2. You must host your automated installer somewhere.


###Examples

Set your ibconsole location:

```
node["incredibuild"]["url"] = "http://path.to.ibconsole.exe"

Set your coordinater url:

```
node["incredibuild"]["install"]["coordinator"] = "yourcoordinatorhostname"
```

Optional, set an install directory:

```
node["incredibuild"]["install"]["installdir"] = "C:\wherever\"
```

Add the install or default recipe to your runlist

##TODO

1. More installation arguments
