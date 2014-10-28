_s.sh: doc/s\ for\ smooth\ source\ control.md
	(sed -n -e 's/^| `s \*\*\([^*]*\)\*\*\([^` (]*\)` *| *`\(svn[^`]*\).*/r_svn[\1\2]="\3"\nr_svn[\1]="\3"/p' \
	       -e 's/^| `s \*\*\([^*]*\)\*\*` (\([^)]*\)) *| *`\(svn[^`]*\).*/r_svn[\1]="\3"\nr_svn[\2]="\3"/p' \
	   '$^' ; \
	 sed -n -e 's/^| `s \*\*\([^*]*\)\*\*\([^` (]*\)` *|[^|]*| *`\(git[^`]*\).*/r_git[\1\2]="\3"\nr_git[\1]="\3"/p' \
	       -e 's/^| `s \*\*\([^*]*\)\*\*` (\([^)]*\)) *|[^|]*| *`\(git[^`]*\).*/r_git[\1]="\3"\nr_git[\2]="\3"/p' \
	   '$^') | \
	  sed -e '/???/d' -e 's/\(\[[a-z]*\)-/\1_/' > $@
