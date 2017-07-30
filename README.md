# Salesforce DX

#### Phoenix TrailheaDX Gathering - 8/3/2017

## Prerequisites
* [Download Salesforce DX](https://developer.salesforce.com/docs/atlas.en-us.208.0.sfdx_setup.meta/sfdx_setup/sfdx_setup_install_cli.htm)
* [Request a 30 Day DevHub Org](https://developer.salesforce.com/promotions/orgs/dx-signup)
* [Get a GitHub.com Account](https://github.com/)
* [DX Command Reference](https://github.com/nortonmd/dx-commands)

## Nice to have
* tree command - ```brew install tree```
* jq command - ```brew install jq```
* [SourceTree by Atlassian](https://confluence.atlassian.com/get-started-with-sourcetree/install-sourcetree-847359094.html)

## About DX commands
**Flags**

```
-d  Your DevHub Org
-a  Assign Org Alias
-u  Reference Org Alias
```

**Getting Help**

```
sfdx force:command --help
```

**DX-Commands Quick Reference** [link](https://github.com/nortonmd/dx-commands)

Nearly all sequetial.  Easy to search.  Drill down for each command.


## Let's Go

**Create a project**

```bash
$ cd workspace
$ sfdx force:project:create -n dxproject
$ cd dxproject
$ tree
```
![tree results](images/empty-project-tree.png)

Update the sfdx-project.json configuration file and change the *orgName* value to something else.  Example (Phoenix Salesforce Developers).

**Connect your DevHub Account**

```bash
$ sfdx force:auth:web:login -d -a DevHub 
```

**Connect your VCS**

Launch your browser to your GitHub.com account.  Create a repository for your DX project.  

![Create a Repo](images/dx-demo-create-repo.png)

Initialize your local repository and link it to your GitHub repo.

```
$ git init
$ echo ".sfdx/*" > .gitignore
$ init add .
$ git commit -m "Initial Commit"
$ git remote add origin https://github.com/nortonmd/sfsunday
$ git pull origin master
```

Note: There will be a conflict when mergine the README.md file.  Edit those file to resolve the conflicts, then ```git add``` & ```git commit``` the README.md.  Then push the project in this state to GitHub.

```
git add README.md
git commit -m "Resolve conflict on README.md"
git push origin master
```

Refresh your browser and checkout your repo in GitHub.

**Retrieve a package**

With DX, development work is separated into modules.  These modules are similar to packages or libraries in Java and C#.  This compartmentalization makes code management much simpler.

If your code is not already contained in packages, start creating packages with related components.

For the purpose of this demo I have already created a package in my *spaceforcedev* sandbox named ```spaceforcePkg``` with all of the components for my app.  In my package I have a permission set called ```Spaceforce Perms``` with access to the app, objects & fiels, and code components.

```
$ sfdx force:mdapi:retrieve -s -r ./mdapi -p spaceforcePkg -u spaceforcedev -w 10
```

![metadata retrieve](images/sfdx-force-mdapi-retrieve.png)

This retrieves the components in the package from the sandbox ```spaceforcedev``` and places them into a zip file in the ```/mdapi``` folder.

Unzip the retrieve file and show the results.

```
$ cd mdapi
$ unzip unpacakged.zip
```

![inflated package](images/unzipped-package.png)

The zip file no longer serves a purpose and can be removed ```rm -f unpackaged.zip```

Push your components to GitHub.  *remember which directory you're in.*

```
$ git add .
$ git commit -m "Metadata Retrieved"
$ git push origin master
```

Check out your repo in GitHub.  Click into the mdapi/objects folder to open up one of the objects.  Note the blended XML in the .object file.  Files with blended metadata are nearly impossible to version.  

Convert the metadata format to the new DX format and push that code to GitHub.

```
$ sfdx force:mdapi:convert -r mdapi/
```

![converted to dx format](images/converted-to-dx.png)

```
$ git add .
$ git commit -m "Components converted to DX format"
$ git push origin master
```

In GitHub, look at the force-app/main/default/objects folder.  Notice that each object is now a folder, and each of the categories of metadata is a folder, and each component is a new xml file.  Metadata stored in individual files are much easier to track in version control.

**Create a scratch org and deploy your code**



