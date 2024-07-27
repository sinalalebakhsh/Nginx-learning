# Configure Cloudflare DNS Settings:
    # Log in to your Cloudflare account and select your domain (acronproject.com).
    # Go to the DNS settings.
    # Add an A record pointing your domain (acronproject.com) to your server's IP address (154.16.16.239):
    #     Type: A
    #     Name: @
    #     IPv4 Address: 154.16.16.239
    #     TTL: Auto
    # Ensure the proxy status is set to "Proxied" (orange cloud) if you want to use Cloudflare's CDN and security features. If you want direct connection without these features, set it to "DNS only" (grey cloud).



# Set Up Nginx on Ubuntu Server:

    # Update your package list and install Nginx:
sudo apt update
sudo apt upgrade
    # If connection wil be lost
    sudo dpkg --configure -a

sudo apt install nginx

    # Start and enable Nginx to run on boot:
sudo systemctl start nginx
sudo systemctl enable nginx

    # Check the status to ensure Nginx is running:
sudo systemctl status nginx



# Configure Nginx to Serve Your Domain:

    # Create a new Nginx configuration file for your domain:
sudo nano /etc/nginx/sites-available/acronproject.com

    # Add the following configuration to the file:
server {
    listen 80;
    server_name acronproject.com www.acronproject.com;

    root /var/www/acronproject.com;
    index index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }
}



    # Create the document root directory and an index file:
sudo mkdir -p /var/www/acronproject.com

sudo nano /var/www/acronproject.com/index.html
    # Add some basic HTML content to the index file for testing:
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Acron Project</title>
</head>
<body>
    <h1>Welcome to Acron Project</h1>
    <p>This is the default index page for acronproject.com</p>
</body>
</html>


    # Enable the new configuration by creating a symbolic link:
sudo ln -s /etc/nginx/sites-available/acronproject.com /etc/nginx/sites-enabled/

    # Test the Nginx configuration for syntax errors:
sudo nginx -t

    # Reload Nginx to apply the changes:
sudo systemctl reload nginx

# Verify the Setup:
    # Open your web browser and navigate to http://acronproject.com.
http://acronproject.com
    # You should see the content of your index.html file if everything is set up correctly.




# ==============================================
# ==============================================
# ==============================================
# Install Docker and Docker Compose:
    # Update your package list and install Docker:
sudo apt update
sudo apt install docker.io
    # tart and enable Docker to run on boot:
sudo systemctl start docker
sudo systemctl enable docker
    # Install Docker Compose:
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
    # Verify the installation:
docker --version
docker-compose --version






# ==============================================
# ==============================================
# ==============================================
# Set Up Docker for Your Django Application:

# Configure Nginx as a Reverse Proxy:
    # Create a new Nginx configuration file for your Django application:
sudo nano /etc/nginx/sites-available/acronproject.com
    # Add the following configuration to the file:
server {
    listen 80;
    server_name acronproject.com www.acronproject.com;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /static/ {
        alias /path/to/your/staticfiles;
    }

    location /media/ {
        alias /path/to/your/mediafiles;
    }
}


    # Enable the new configuration by creating a symbolic link:
sudo ln -s /etc/nginx/sites-available/acronproject.com /etc/nginx/sites-enabled/
    # Test the Nginx configuration for syntax errors:
sudo nginx -t

    # Reload Nginx to apply the changes:
sudo systemctl reload nginx


# Ensure your Django application is set up to serve static and media files.
# Update your settings.py file:
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')






# CHECK git was Installed
git --version
git version 2.43.0
cd /home/
mkdir sina
cd sina/
mkdir django
cd django/
root@XXX-XXXX:/home/sina/djangoX#







