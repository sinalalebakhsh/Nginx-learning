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











