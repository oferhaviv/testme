# /e/Users/oferh/Documents/git/project
#!/bin/bash 
set +x
INP="1.3"
#INP="1.5"
#INP="master"
# check if the input branch exists
# if not create new and update POM file

#result=`git branch --list`

# init start point
git checkout master

if  [ `git branch --list Release/$INP` ]
then
	echo "Branch Release/$INP exist"

	# Heading branch Release/$INP
	git checkout Release/$INP
	#git checkout Release/$INP
else

	echo "Branch Release/$INP not exists"
	#git checkout -B Release/$INP master
	#echo "Branch Release/$INP create."
	
	#POM file update
fi

