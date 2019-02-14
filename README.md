Nordvpn server speed test. This uses a New York based AT&T server to test the connection of nordvpn speeds. To use this script it must be configured. 
-------------------------
1. edit "fileEdit.py" so the path to ur server config files is correct also create if you dont already have one a "auth.txt" with ur nord username and password in first and second line respectivly. Specify this files path in "fileEdit.py". This script moves through each conf file and adds the path of auth.txt so manuel sign in is not required when trying to connect to each.
2. After fileEdit is done you must change the permissions of the file back.
'''
sudo chmod -R 777 [Path to conf file Directory]
'''
3. Install speedtest-cli: this process depends on which os your computer is running but here are the basic commands for ubuntu. Link to site https://www.2daygeek.com/speedtest-cli-check-internet-bandwidth-speed-command-line-linux/ 
''' 
sudo apt-get install python-pip git
sudo apt-get install speedtest-cli
'''
4. to run, go to the folder in which bashtest.sh is located and run
'''
sudo ./bashtest.sh
'''
