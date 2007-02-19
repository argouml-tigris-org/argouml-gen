#!/bin/sh

# This script creates a new index.html file.

( cd argouml-stats/www && ls */*/index.html ) |
awk 'BEGIN { print "<!-- This files is automatically generated by the create-index.sh script. -->";
             print "<html><head><title>ArgoUML Automatically Generated Files</title></head><body>";
             print "<ul>"; }
     { sub(/index.html/,"");
       printf "<li><a href=\"nonav/%s\">%s</a>\n", $NF, $NF; }
     END { print "</ul>";
	   print "</body>"; }'