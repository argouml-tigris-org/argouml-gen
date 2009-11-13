#!/bin/sh
# $Id: closettop.sh 558 2009-10-08 21:38:24Z linus $

# This script commits things in the argouml-stats project if the ordinary
# commit failed.
#
# The argument, an integer, is the chunk size. 
# If missing, all files are attempted.

ARG=$1
if test -z "$ARG"
then
  echo $(date): Committing all the rest...
  cd argouml-stats/www
  svn commit -m"Committing all the rest" --non-interactive --no-auth-cache ||
      svn update --non-interactive --no-auth-cache --accept=mine-full
  echo $(date): Committing all the rest...done
else
  echo $(date): Committing all the rest in chunks of $ARG files...
  cd argouml-stats/www
  svn status --non-interactive --no-auth-cache |
  awk '/^[AM]/ { print $2; }' |
  xargs --max-args=$ARG --no-run-if-empty \
      svn commit -m"Committing all the rest (in chunks of $ARG files)" \
          --non-interactive --no-auth-cache ||
      svn update --non-interactive --no-auth-cache --accept=mine-full
  echo $(date): Committing all the rest in chunks of $ARG files...done
fi
