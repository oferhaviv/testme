# /e/Users/oferh/Documents/git/project
#!/bin/bash 
set +x
INP="1.4"
buildNumber=0
#INP="1.5"
#INP="master"
# check if the input branch exists
# if not create new and update POM file

function computeNextBuild()
{

local var=`git tag -l V$INP*`

echo $var
	#echo build is $buildNumber
	
}

#result=`git branch --list`

# init start point
git checkout master -q
git add hello.sh

#check if version exists (adding Release as prefix)
if  [ `git branch --list Release/$INP` ]
then

	echo "Branch Release/$INP exist"
	
	# Heading branch Release/$INP
	git checkout Release/$INP -q
	echo "Switched to Release/$INP"
	

	computeNextBuild
	
else

	echo "Branch Release/$INP not exists"
	
	#create new branch
	git checkout -B Release/$INP master -q
	echo "Branch Release/$INP create."
	
	#POM file update with version
	search="<version>development-SNAPSHOT<"
	rep="<version>"$INP"-SNAPSHOT<"
	sed -i 's/'${search}'/'${rep}'/g' pom.xml
	git add pom.xml
	git commit -m "update pom.xml file"

fi



#xml ed -N p=http://maven.apache.org/POM/4.0.0 -u "/p:project/p:version" -v $INP"."$buildNumber2.7.13-NEW-SNAPSHOT" pom.xml > ./pom_new.xml



#debug - return to start point
git checkout master -q
#git branch -d Release/1.4