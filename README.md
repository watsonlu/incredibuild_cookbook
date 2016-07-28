# Incredibuild-Cookbook

Adds basic support for installing, updating, repairing and uninstalling incredibuild agents


##Requirements

1. You must have created an automated installer from your incredibuild installer. Run the installer, then click "Create Automated Installer"
2. You must host your automated installer somewhere.


###Examples

####Installing

```
node["incredibuild"]["install"]["coordinator"] = "yourcoordinatorhostname"
```

####Uninstalling

```
node["incredibuild"]["uninstall"]
```

###Repairing

```
node["incredibuild"]["repair"]
```

###Updating

```
node["incredibuild"]["update"]
```

##TODO

1. Installation arguments

