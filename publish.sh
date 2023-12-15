#!/bin/bash

find ./static/images/ -type f -exec file --mime-type {} \+ | awk -F: '{if ($2 ~/image\//) print $1}' | xargs -i mogrify -strip {}
git add -A -- .
git commit -m "update"