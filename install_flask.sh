#!/bin/bash
# Update the instance's package list
apt-get update -y

# Install Python 3, pip, and the venv module required for virtual environments
apt-get install -y python3-pip python3.12-venv

# Set up port forwarding from 80 to 5000
# This allows our non-root app to be accessible on the standard HTTP port
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 5000

# Create a directory for the Flask app
mkdir /home/ubuntu/flaskapp
cd /home/ubuntu/flaskapp

# Create a Python virtual environment
python3 -m venv venv

# Install Flask using the pip from the new virtual environment
/home/ubuntu/flaskapp/venv/bin/pip install Flask

# Create the Flask application file
cat <<EOF > app.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return """
    <!DOCTYPE html>
    <html>
    <head>
        <title>Flask App on Ubuntu</title>
        <style>
            body { font-family: Arial, sans-serif; text-align: center; margin-top: 50px; background-color: #f0f2f5; }
            h1 { color: #333; }
            p { color: #666; }
            .container { background-color: white; padding: 2em; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); display: inline-block;}
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Hello from Flask!</h1>
            <p>This page is served by a Python Flask application running on an AWS EC2 instance with Ubuntu 24.04.</p>
            <p>The infrastructure was deployed using Terraform.</p>
        </div>
    </body>
    </html>
    """

if __name__ == '__main__':
    # Run the app on a non-privileged port (e.g., 5000)
    app.run(host='0.0.0.0', port=5000)
EOF

# Change ownership of the app directory to the ubuntu user
chown -R ubuntu:ubuntu /home/ubuntu/flaskapp

# Run the Flask app using the python executable from the virtual environment
sudo -u ubuntu /home/ubuntu/flaskapp/venv/bin/python /home/ubuntu/flaskapp/app.py > /dev/null 2>&1 &