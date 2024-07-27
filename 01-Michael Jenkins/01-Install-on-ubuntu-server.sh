# Origin Pages Source:
# 	https://www.nginx.org/
# 	https://www.nginx.com/

# 1- 
apt update

apt upgrade
# ===================================================
# 2-
apt install nginx
# ===================================================
# 3-
apt update
apt upgrade
apt update
# ===================================================
# 4-
nginx -v

# Output:
# nginx version: nginx/1.18.0 (Ubuntu)
# ===================================================
# 5-
systemctl status nginx

# Output:
#     ● nginx.service - A high performance web server and a reverse proxy server
#      Loaded: loaded (/S/SS/zz/nginx.service; enabled; vendor preset: enabled)
#      Active: active (running) since Mon 2099-023-130 13:37:53 UTC; 1min 40s ago
#         ...
#         ...

# ===================================================
# 6- Go in browser than link your website/IP/VPS,etc 
# should see default page NginX


# ===================================================
# 7-
systemctl status nginx --no-pager

# Output:
#     ● nginx.service - A high performance web server and a reverse proxy server
#      Loaded: loaded (/S/SS/zz/nginx.service; enabled; vendor preset: enabled)
#      Active: active (running) since Mon 2099-023-130 13:37:53 UTC; 1min 40s ago
#     ...
#     ...
# ===================================================
# 8-
systemctl stop nginx
# ===================================================
# 9-
systemctl status nginx

# Output:
#     ○ nginx.service - A high performance web server and a reverse proxy server
#      Loaded: loaded (/S/SS/zz/nginx.service; enabled; vendor preset: enabled)
#      Active: inactive (dead) since Mon 2024-02-12 13:50:17 UTC; 4s ago
#      ...
#      ...
# ===================================================
# 10-
systemctl start nginx
# ===================================================
# 11-
systemctl status nginx

# Output:
    # ● nginx.service - A high performance web server and a reverse proxy server
    #  Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
    #  Active: active (running) since Mon 2024-02-12 13:52:47 UTC; 34s ago
    #  ...
    #  ... 
# ===================================================
# 12-
nginx -h

# Output:
#     nginx version: nginx/1.18.0 (Ubuntu)
# Usage: nginx [-?hvVtTq] [-s signal] [-c filename] [-p prefix] [-g directives]

# Options:
#   -?,-h         : this help
#   -v            : show version and exit
#   -V            : show version and configure options then exit
#   -t            : test configuration and exit
#   -T            : test configuration, dump it and exit
#   -q            : suppress non-error messages during configuration testing
#   -s signal     : send signal to a master process: stop, quit, reopen, reload
#   -p prefix     : set prefix path (default: /usr/share/nginx/)
#   -c filename   : set configuration file (default: /etc/nginx/nginx.conf)
#   -g directives : set global directives out of configuration file
# ===================================================
# 13-
nginx -t

# Output:
    # nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
    # nginx: configuration file /etc/nginx/nginx.conf test is successful
# ===================================================
# 14-
nginx -T

# Output:
    # nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
    # nginx: configuration file /etc/nginx/nginx.conf test is successful
    # configuration file /etc/nginx/nginx.conf:
    # ...
    # ...
# ===================================================
# 15-
cd /etc/nginx
# Than
ls

# Output:
    # conf.d        fastcgi_params  koi-win     modules-available  nginx.conf
    # ...
    # ...
# ===================================================
# 16-
more nginx.conf

# Output:
    # user www-data;
    # worker_processes auto;
    # ...
    # ...
    # --More--(40%)
# ===================================================
# 17- CHECK THIS 
more /etc/nginx/sites-available/default
# ===================================================
# 18-
cd /var/log/nginx
# THAN
ls

# Output:
    # access.log  error.log
# ===================================================
# 19-
head access.log

# Output:
    # ...
    # [IP Your server] - - [12/Feb/2024:13:42:10 +0000] "GET / HTTP/1.1" 200 396 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:122.0) Gecko/20100101 Firefox/122.0"
    # e.g. 
    # 123.10.10.143 - - [12/Feb/2024:13:42:10 +0000] "GET / HTTP/1.1" 200 396 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:122.0) Gecko/20100101 Firefox/122.0"
    # ...
# ===================================================
# 20-
head error.log

# Output:
    # 2024/02/12 13:27:30 [notice] 22894#22894: Signal process started
    # 2024/02/12 13:27:31 [notice] 22907#22907: Signal process started
    # 2024/02/12 13:27:32 [notice] 23001#23001: Signal process started
    # ...
    # ...
# ===================================================
# 21-
cd /var/www
# than
ls

# Output:
    # html
# ===================================================
# 22-
find .

# Output:
    # .
    # ./html
    # ./html/index.nginx-debian.html
# ===================================================
# 23-
cd /etc/nginx
# than
view nginx.conf

# Output:
    # user www-data;
    # worker_processes auto;
    # ...
    # ...
# ===================================================
# 24-
:q

# Press Enter key
# ===================================================
# 25-
cd sites-enabled/
# than
ls

# Output:
    # default
# ===================================================
# 26-
cd ../conf.d/
# than
ls

# Output: should be shows nothing!!
# ===================================================
# 27- Look at "009-Inside nginx conf.png" link
# https://www.nginx.org/en/docs/dirindex.html

# ===================================================
# 28-
ls -ltr /etc/nginx/sites-enabled/

# Output:
    # total 0
    # lrwxrwxrwx 1 root root 34 Feb 12 13:27 default -> /etc/nginx/sites-available/default
# ===================================================
# 29-
unlink /etc/nginx/sites-enabled/default


ls -ltr /etc/nginx/sites-enabled/
# Output:
# total 0

# ===================================================
# 30-
ls -ltr /etc/nginx/sites-available/

# Output:
    # total 4
    # -rw-r--r-- 1 root root 2412 May 30  2023 default
# ===================================================
# 31-
nano /etc/nginx/conf.d/acronproject.conf
# ===================================================
# 32- Press "I" key for Insert mode
# i

# Output: in bottom screen:
-- INSERT --  
# ===================================================
# 33- write
server {
    listen 80;
    root /var/www/acronproject;
}
# ===================================================
# 34- Press "Esc" key
# ===================================================
# 35- write
:wq
# than hit the Enter button
# ===================================================
# 36-
cat /etc/nginx/conf.d/acronproject.conf

# Output:
    server {
        listen 80;
        root /var/www/acronproject;
    }
# ===================================================
# 37- Test the configuration
nginx -t

# Output:
    # nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
    # nginx: configuration file /etc/nginx/nginx.conf test is successful
# ===================================================
# 38-
systemctl reload nginx
# ===================================================
# 39-
systemctl status nginx
# ===================================================
# 40-
mkdir -p /var/www/acronproject
# ===================================================
# 41- Let's put a test file in that directory
echo "Acron Project HOME PAGE" > /var/www/acronproject/index.html
# ===================================================
# 42- Go to your IP/Server/WebSite/  and check changes
http://154.16.16.239/
# ===================================================
# 43-
nano /etc/nginx/conf.d/acronproject.conf
# ===================================================
# 44- Change content like this
server {
    listen 80 default_server;
    server_name acronproject.com www.acronproject.com;
    index index.html index.htm index.php;
    root /var/www/acronproject
}
# ===================================================
# 45- for more information
https://www.nginx.org/en/docs/http/request_processing.html
# ===================================================
# 46-
nginx -t

# Output:
    nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
    nginx: configuration file /etc/nginx/nginx.conf test is successful
# ===================================================
# 47-
systemctl reload nginx
# ===================================================
# 48-
curl localhost

# Output: content in index.html, for main is
    Acron Project HOME PAGE

# ===================================================
# Source these commands
    https://github.com/LinkedInLearning/learning-nginx-2492317/tree/d4220816275d6b732f1a750a5f384f6e11c68dcc/Ch01/01_08-add-files-to-the-root-directory
# OR
    https://github.com/AcronProjectGroup/learning-nginx-2492317/tree/main/Ch01/01_08-add-files-to-the-root-directory
# ===================================================
# 49-
cd /root
# ===================================================
# 50-
pwd

# Output:
    /root
# ===================================================
# 51-
git clone git@github.com:LinkedInLearning/learning-nginx-2492317.git
OR
git clone https://github.com/LinkedInLearning/learning-nginx-2492317.git
# ===================================================
# 52-
ls learning-nginx-2492317/

# Output:
    acronproject_robot_website_LIL_107684.tgz  Ch00  Ch02  Ch04  Ch06             LICENSE  README.md
    acronproject_robot_website_LIL_107684.zip  Ch01  Ch03  Ch05  CONTRIBUTING.md  NOTICE
# ===================================================
# 53-
tar xvf ~/learning-nginx-2492317/acronproject_robot_website_LIL_107684.tgz --directory /var/www/acronproject/
# ===================================================
# 54-
ls /var/www/acronproject/

# Output:
    403.html  50x.html  account  blog  checkout  humans.txt  index.html  README.rtf  shop
    404.html  about     assets   cart  contact   images      private     robots.txt  _style-guide

# ===================================================
# 55-
cd /root/learning-nginx-2492417/Ch02/02_03-configure-locations-part-2
# ===================================================
# 56-
# ===================================================
# 57-
# ===================================================
# 58-
# ===================================================
# 59- 
# ===================================================
# 60-
# ===================================================
# 61-
# ===================================================
# 62-
# ===================================================
# 63-
# ===================================================
# 64-
# ===================================================
# 65-
# ===================================================
# 66-
# ===================================================
# 67-
# ===================================================
# 68-
# ===================================================
# 69-
# ===================================================
# 70-
# ===================================================
# 71-
# ===================================================
# 72- 
# ===================================================
# 73-
# ===================================================
# 74-
# ===================================================
# 75-
# ===================================================
# 76-
# ===================================================
# 77-
# ===================================================
# 78-
# ===================================================
# 79-
# ===================================================
# 80-
# ===================================================
# 81-
# ===================================================
# 82-
# ===================================================
# 83-
# ===================================================
# 84-
# ===================================================
# 85-
# ===================================================
# 86-
# ===================================================
# 87-
# ===================================================
# 88-
# ===================================================
# 89-
# ===================================================
# 90-
# ===================================================
# 91-
# ===================================================
# 92-
# ===================================================
# 93-
# ===================================================
# 94-
# ===================================================
# 95-
# ===================================================
# 96-
# ===================================================
# 97-
# ===================================================
# 98-
# ===================================================
# 99-
# ===================================================
# 100-
# ===================================================
# 101-
# ===================================================
# 102-
# ===================================================
# 103-
# ===================================================
# 104-
# ===================================================
# 105-
# ===================================================
# 106-
# ===================================================
# 107-
# ===================================================
# ===================================================
# ===================================================
# ===================================================
# ===================================================
# ===================================================
# ===================================================
# ===================================================
# ===================================================
# ===================================================
