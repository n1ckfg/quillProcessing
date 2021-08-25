#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

cd $DIR

mkdir build/quillProcessing
javac -cp /Applications/Processing.app/Contents/Java/core.jar quillProcessing/*.java
mv quillProcessing/*.class build/quillProcessing/
cd build
jar cvfm ../quillProcessing.jar manifest.txt quillProcessing/*.class
cd ..
mv quillProcessing.jar ../library/