# /e/Users/oferh/Documents/git/project
#!/bin/bash 
set +x
INP="1.4"
#INP="1.5"
#INP="master"
# check if the input branch exists
# if not create new and update POM file

#result=`git branch --list`

# init start point
git checkout master -q

if  [ `git branch --list Release/$INP` ]
then
	echo "Branch Release/$INP exist"

	# Heading branch Release/$INP
	git checkout Release/$INP -q
	echo "Switched to Release/$INP"
else

	echo "Branch Release/$INP not exists"
	
	git checkout -B Release/$INP master -q
	echo "Branch Release/$INP create."
	
	#POM file update
	search="<version>development-SNAPSHOT<"
	rep="<version>"$INP"-SNAPSHOT<"
	sed -i 's/'${search}'/'${rep}'/g' pom.xml

fi

#debug - return to start point
git checkout master -q
#git branch -d Release/1.4