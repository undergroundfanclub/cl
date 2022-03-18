#!/bin/sh

cleanupFunc () {
for PAGES in $(ls news/ | grep .html); do
    rm -f news/$PAGES
done
}

populateFunc () {
for POSTS in $(ls news/ | grep .md | sed -e 's/\(.md\)*$//g'); do
    touch news/"$POSTS".html
    cat template.html >> news/$POSTS.html
    markdown news/$POSTS.md >> news/$POSTS.html
    printf "</div>\n" >> news/$POSTS.html
    printf "</body>" >> news/$POSTS.html
done
}

postpageFunc () {
cat headpoststemplate.html > posts.html
for PAGES in $(ls news/ | grep .html); do
    printf "<a href="news/$PAGES">$PAGES</a> <br>" >> posts.html
    
done
cat footpoststemplate.html >> posts.html
}

cleanupFunc
populateFunc
postpageFunc