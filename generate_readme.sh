#!/bin/bash

function generate_category() {
    echo "<details close>" >> README.md
    echo "<summary><b>$1</b></summary>" >> README.md
    loop_images $1
    echo -e "</details>\n" >> README.md
}

function generate_image() {
    echo "<img src='$1' width='200px' />" >> README.md
}

function loop_categories() {
    for dir in */ ; do
        dir=$(echo $dir | tr -d "/")
        generate_category "$dir"
    done
}

function loop_images() {
    for img in $1/* ; do
        generate_image "$img"
    done
}

echo "# wallpapers" > README.md
echo -e "A collection of wallpapers\n" >> README.md

loop_categories


