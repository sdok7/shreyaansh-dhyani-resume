#!/bin/sh
# Run after swapping the PDF. Writes its size into the no-JS page in index.html
# (no-JS can't measure anything; with JS the slow-connection page reads the live size from the server).
f=Shreyaansh-Dhyani-Software-Developer-Resume.pdf
b=$(wc -c < "$f" | tr -d ' ')
if [ "$b" -gt 3145728 ]; then echo "$f is over 3 MB" >&2; exit 1; fi
s=$(awk -v b="$b" 'BEGIN{if(b<1048576)printf "%d KB",b/1024+.5;else printf "%.1f MB",b/1048576}')
sed "s|<span class=\"z\">[^<]*</span>|<span class=\"z\">$s</span>|g" index.html > index.html.tmp && mv index.html.tmp index.html
echo "$s"
