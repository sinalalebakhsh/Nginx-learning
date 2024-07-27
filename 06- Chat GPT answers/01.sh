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










