# argouml-gen
Scripts to support the CI and gerrithub verifier.



## Layout
jobs/gerrit,
jobs/deploy,
jobs/create-images,
one directory per job in Jenkins, each with their own README.md file.
As much as possible go into these configuration according to the
configuration as code paradigm.

setup/jenkins,
one directory per tool.
Instructions and tools to configure each tool used.

## History

This was started a long time ago and has suffered many generations of
changes.  First publishing information using cvs on tigris, then using
svn on tigris.  Then moved into hudson and later Jenkins and also from
shell-scripts to groovy.

In 2019, git, github, and gerrithub, a new maven-based build was
started, all groovy and virtualbox and docker.
