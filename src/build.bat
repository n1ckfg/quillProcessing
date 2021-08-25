@echo off

cd %cd%

mkdir build\quillProcessing
javac -cp "C:\Program Files\processing\core\library\core.jar" quillProcessing\*.java
move /y quillProcessing\*.class build\quillProcessing\
cd build
jar cvfm ..\quillProcessing.jar manifest.txt quillProcessing\*.class
cd ..
move quillProcessing.jar ..\library\

@pause