import os as os
from tempfile import mkstemp
from shutil import move
from os import fdopen, remove
from os.path import isfile, join

def replace(file_path, pattern, subst):
    #Create temp file
    fh, abs_path = mkstemp()
    with fdopen(fh,'w') as new_file:
        with open(file_path) as old_file:
            for line in old_file:
                new_file.write(line.replace(pattern, subst))
    #Remove original file
    remove(file_path)
    #Move new file
    move(abs_path, file_path)


os.chdir("/etc/openvpn-2.4.6/ovpn_udp")

files = os.listdir()#[f for f in os.listdir() if "us" in f]  
for x in files:
    replace("/etc/openvpn-2.4.6/ovpn_udp/" + x , "auth-user-pass", "auth-user-pass /etc/openvpn-2.4.6/auth.txt")
