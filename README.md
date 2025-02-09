# Description
A macOS script to save only certain file types (coding files, but not data file for example) while maintaining directory structure

# Instructions for Use

1. Copy the `copyCodeFiles.sh` file to your macbook desktop
1. Open the Terminal app
1. type `cd desktop` to move to the desktop directory
1. type `ls` to list the contents of the directory - copyCodeFiles.sh should be listed 
1. open the copyCodeFiles.sh file 
1. change the three variables, SOURCE, DESTINATION and EXTENSIONS to the source directory, output directory and type of extensions you would like to copy.
1. go back to the Terminal app
1. type `chmod +x copyCodeFiles.sh` to make the script executable
1. type `./copyCodeFiles.sh` to run the script

Depending on the number of files to be copied, this may be very quick or take several minutes. Once all the files are copied the message *Copy process complete.* will be displayed.

The DESTINATION directory will contain a copy of all the folders in the SOURCE directory, with all the files with the specified EXTENSIONS, but none of the other files.  Can be useful for backing up coding and markup files without copying the data sources.
