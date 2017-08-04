# Command Line Interface Ninja Skills

### The Command Line - Bash
#### Learn it, know it, live it
![brad from fast time pic](images/brad.png)

```
$ ps
/bin/bash
$ echo "Hello, World"
Hello, World
$ whoami
nortonmd
```

### History?  What did that ever teach us?
![mr hand's history class](images/mr-hand.jpg)

```
$ history
  1 ps
  2 echo "Hello, World"
  3 whoami
$ 
```

### Hitting the Pipe
![what can pipes do for you?](images/pipes.jpg)

```
$ echo "is there anybody out there?" | tr a-z A-Z
IS THERE ANYBODY OUT THERE?
$ history | tail -3
  3 whoami
  4 history
  5 echo "is there anybody out there?" | tr a-z A-Z
```

### Gnu Regular Expression Parser (a.k.a. "grep")
![gnu's not unix](images/gnu.png)
[GNU](https://en.wikipedia.org/wiki/GNU)

```
$ history | grep "sfdx"
 43 sfdx force:org:list
 52 sfdx force:org:open
 55 sfdx force:source:pull
$ cat mdapi/package.xml | egrep -v "types|members"
<?xml version="1.0" encoding="UTF-8"?>
<Package xmlns="http://soap.sforce.com/2006/04/metadata">
    <name>CustomApplication</name>
    <name>ApexClass</name>
    <name>Layout</name>
    <name>CustomObject</name>
    <name>ApexPage</name>
    <name>PermissionSet</name>
    <name>CustomTab</name>
  <version>40.0</version>
</Package>
```

### grep for the -win
![charlie](images/winning.jpeg)

```
$ grep -win Galaxy__c force-app/main/default/classes/*.cls
force-app/main/default/classes/GalaxyAddExtension.cls:8:    public Galaxy__c galaxy { get; set; }
force-app/main/default/classes/GalaxyAddExtension.cls:16:        galaxy = (Galaxy__c)controller.getRecord();
force-app/main/default/classes/GalaxyAddExtension.cls:40:                star.Galaxy__c = galaxy.Id;
force-app/main/default/classes/GalaxyAddExtension.cls:52:        return new PageReference( '/' + Galaxy__c.sObjectType.getDescribe().getKeyPrefix() + '/o');
force-app/main/default/classes/GalaxyAddExtensionTest.cls:16:		Galaxy__c galaxy = new Galaxy__c();
force-app/main/default/classes/GalaxyAddExtensionTest.cls:24:		List<Galaxy__c> galaxies = [select Id, Name
force-app/main/default/classes/GalaxyAddExtensionTest.cls:25:									  from Galaxy__c
force-app/main/default/classes/GalaxyAddExtensionTest.cls:39:		Galaxy__c galaxy = new Galaxy__c();
force-app/main/default/classes/GalaxyAddExtensionTest.cls:67:		Galaxy__c galaxy = new Galaxy__c();
force-app/main/default/classes/GalaxyAddExtensionTest.cls:74:		List<Galaxy__c> galaxies = [select Id, Name
force-app/main/default/classes/GalaxyAddExtensionTest.cls:75:		from Galaxy__c];
force-app/main/default/classes/GalaxyAddExtensionTest.cls:88:		Galaxy__c galaxy = new Galaxy__c();
force-app/main/default/classes/GalaxyAddExtensionTest.cls:101:		List<Galaxy__c> galaxies = [select Id, Name from Galaxy__c];
```

### Redirect
![Judo Move](images/judo-move.gif)

```
$ echo "History of DX Commands" > dx_commands.txt
$ history |grep "sfdx" >> dx_commands.txt
$ echo "End of DX Commands" >> dx_commands.txt
```

### Shhhhh-mod?  Or Change Mode (with Transformer sound here)
![transformers](images/transformers.jpeg)

```
$ ./dx_commands.sh
-bash: dx_commands.sh: command not found
$ chmod +x dx_commands.sh
$ ./dx_commands.sh
```

### PATH
#### The PATH of the rightous man, ...
![Jules from Pulp Fiction](images/jules.jpg)

```
$ mkdir /users/yournamehere/bin
$ mv dx_commands.sh /user/yournamehere/bin
$ export "PATH=${PATH}:/users/yournamehere/bin"
$ dx_commands.sh
```

### Alias
#### Allow myself to introduce, ... myself
![Austin Powers](images/austin-powers.png)

```
$ alias gpom="git push origin master"
$ alias
alias gpom='git push origin master'
alias rm='rm -i'
$ gpom
Counting objects: 3, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 296 bytes | 0 bytes/s, done.
Total 3 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/nortonmd/dxthor
   6102a03..202c377  master -> master
```

### More Reading
#### Would you like to know more?
![Starship Troopers](images/would-you-like-to-know-more.jpg)

* [Learn X in Y Minutes](https://learnxinyminutes.com/docs/bash/)
* [udemy](https://www.udemy.com/learn-bash-shell-in-linux-for-beginners/?utm_source=adwords-learn&utm_medium=udemyads&utm_campaign=NEW-AW-PROS-TECH-US-DSA-EN-ENG_._ci__._sl_ENG_._vi_TECH_._sd_All_._la_EN_._&utm_content=_._ky_&utm_term=_._ag_37856612377_._ad_178072966559_._de_c_._dm__._pl__._ti_dsa-283507678709_._li_9030159_._pd__._&gclid=Cj0KCQjwqvvLBRDIARIsAMYuvBFmVAidqN7MrhcwkVzvarI_V8kfWg2DkLgZOpDH7ceqQ5A8UgF5JeEaAm_4EALw_wcB)
* [lynda](https://www.lynda.com/Bash-tutorials/Up-Running-Bash-Scripting/142989-2.html?utm_source=google&utm_medium=cpc&utm_campaign=l1-US-Search-Dev-Bash&cid=l1-us:en:ps:lp:prosc:s50:1804:all:google:xct-learn_bash&utm_content=110490597666&utm_term=learn%20bash&src=go-pa&veh=skwd-63929456226_pcrid_110490597666_pkw_learn%20bash_pmt_e_pdv_c_ext__plc__trg__agid_15832219146_cmid_176407146_adp_1t3_net_g&lpk35=9137)
* [Bash Academy](http://www.bash.academy/)



