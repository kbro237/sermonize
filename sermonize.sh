#!/usr/bin/env bash

textfile=$1
sermon=`basename "$textfile" | sed 's/\.txt//'`

# runs pandoc with the xelatex engine using a latex template on an arbitrary multimarkdown file and then opens the pdf that's created with the same name as the txt file (sans txt suffix).

pandoc --latex-engine=xelatex --template="$HOME/.pandoc/sermon.latex" -f markdown_mmd -o "$sermon.pdf" "$textfile"; open "$sermon.pdf"

# prepare sermon for a pelican static blog and then upload it to the server
cp "$textfile" "$HOME/preaching/content/$sermon.md"
cd "$HOME/preaching"; make rsync_upload
