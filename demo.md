# Salesforce DX & Packaging Demo

Create a project called `demo`

```bash
$ mkproj demo

sfdx force:project:create -n demo
target dir = /Users/mnorton/workspace/dx
   create demo/sfdx-project.json
   create demo/README.md
   create demo/.forceignore
   create demo/config/project-scratch-def.json


$ cd demo
```

Create a class called `VFUtil`

```bash
$ mkclass VFUtil

target dir = ./workspace/dx/demo/force-app/main/default/classes
   create VFUtil.cls
   create VFUtil.cls-meta.xml

sfdx force:apex:class:create -n VFUtilTest -d force-app/main/default/classes
target dir = ./workspace/dx/demo/force-app/main/default/classes
   create VFUtilTest.cls
   create VFUtilTest.cls-meta.xml
```

Edit the classes for content using VS Code

```bash
$ code .
```

Create a scratch org called `vftest`

```bash
$ mkorg vftest

sfdx force:org:create -s -f config/project-scratch-def.json -a vftest
Successfully created scratch org: 00D..., username: test-...@example.com
sfdx force:user:password:generate -u vftest
Successfully set the password "B|a8Na$%uD" for user test-...@example.com.
You can see the password again by running "sfdx force:user:display -u test-...@example.com".
sfdx force:org:display
=== Org Description
KEY              VALUE
───────────────  ────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Access Token     00D...
Alias            vftest
Client Id        SalesforceDevelopmentExperience
Created By       *********@example.com
Created Date     2018-05-14T22:29:27.000+0000
Dev Hub Id       *********@example.com
Edition          Developer
Expiration Date  2018-05-21
Id               00D...
Instance Url     https://ruby-java-6171-dev-ed.cs62.my.salesforce.com
Org Name         yourname Company
Password         B|a8Na$%uD
Status           Active
Username         test-...@example.com
```

Push the source to the scratch org

```base
$ sfdx force:source:push

=== Pushed Source
STATE  FULL NAME   TYPE       PROJECT PATH
─────  ──────────  ─────────  ──────────────────────────────────────────────────────
Add    VFUtil      ApexClass  force-app/main/default/classes/VFUtil.cls
Add    VFUtil      ApexClass  force-app/main/default/classes/VFUtil.cls-meta.xml
Add    VFUtilTest  ApexClass  force-app/main/default/classes/VFUtilTest.cls
Add    VFUtilTest  ApexClass  force-app/main/default/classes/VFUtilTest.cls-meta.xml
```

Run all tests

```bash
$ runtests

sfdx force:apex:test:run -c -r human
=== Apex Code Coverage
ID                  NAME    % COVERED  UNCOVERED LINES
──────────────────  ──────  ─────────  ───────────────
01p5C000000SKnvQAG  VFUtil  100%

=== Test Results
TEST NAME                   OUTCOME  MESSAGE  RUNTIME (MS)
──────────────────────────  ───────  ───────  ────────────
VFUtilTest.testAllMessages  Pass              13

=== Test Summary
NAME                 VALUE
───────────────────  ─────────────────────────────────────────────────────
Outcome              Passed
Tests Ran            1
Passing              1
Failing              0
Skipped              0
Pass Rate            100%
Fail Rate            0%
Test Start Time      May 14, 2018 3:33 PM
Test Execution Time  13 ms
Test Total Time      13 ms
Command Time         2198 ms
Hostname             https://ruby-java-6171-dev-ed.cs62.my.salesforce.com
Org Id               00D...
Username             test-...@example.com
Test Run Id          7075C00000ED1PL
User Id              0055C000000tZakQAE
```

Create a developer controlled package

```bash
$ mkpkg vfutil

Successfully created a second-generation package (package2). 0Ho0g0000008OIFCA2 0330g000000TiF6AAK
=== Ids
NAME                   VALUE
─────────────────────  ──────────────────
Package2 Id            0Ho0g0000008OIFCA2
Subscriber Package Id  0330g000000TiF6AAK
```

Put the package information in the project definition

```bash
$ vi sfdx-project.json 

------
{
  "packageDirectories": [ 
    {
      "path": "force-app",
      "default": true,
      "id": "0Ho0g0000008OIFCA2",
      "versionName": "Version 1.0",
      "versionNumber": "1.0.0.NEXT"
    }
  ],
  "namespace": "",
  "sfdcLoginUrl": "https://login.salesforce.com",
  "sourceApiVersion": "42.0"
}
------
```

Make a new package version

```bash
$ mkversion

sfdx force:package2:version:create --directory force-app --wait 10
Request in progress. Sleeping 30 seconds. Will wait a total of 600 more seconds before timing out. Current Status='InProgress'
Request in progress. Sleeping 30 seconds. Will wait a total of 570 more seconds before timing out. Current Status='InProgress'
Request in progress. Sleeping 30 seconds. Will wait a total of 540 more seconds before timing out. Current Status='InProgress'
...

```

Install the package contents into the scratch org 

```bash
$ sfdx force:package:install --id 04t0g000000YUDrAAO --wait 5
```

