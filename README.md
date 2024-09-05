
# Additional Resources
# Access related files here: https://drive.google.com/drive/folders/1Os614PQw6uNqxqZpCC2CqH1wnhrvSgsU?usp=sharing


To enable and use SSH commands, you need to have the OpenSSH server installed and running on your system. Here’s a general guide to enable SSH commands:

### On Linux

1. **Install OpenSSH Server** (if not already installed):
   ```bash
   sudo apt update
   sudo apt install openssh-server
   ```

2. **Start and Enable SSH Service**:
   ```bash
   sudo systemctl start ssh
   sudo systemctl enable ssh
   ```

3. **Check SSH Service Status**:
   ```bash
   sudo systemctl status ssh
   ```

4. **Configure SSH** (if needed):
   - Edit the SSH configuration file:
     ```bash
     sudo nano /etc/ssh/sshd_config
     ```
   - Make sure the following line is not commented out (remove `#` if present):
     ```bash
     PermitRootLogin yes
     ```

5. **Restart SSH Service** to apply any changes:
   ```bash
   sudo systemctl restart ssh
   ```

6. **Allow SSH Through Firewall** (if applicable):
   ```bash
   sudo ufw allow ssh
   ```

# Jenkins Installation Guide

This guide will walk you through the process of installing Jenkins on a Linux system.

## Prerequisites

- A Linux distribution (e.g., Ubuntu, Debian, or Kali Linux)
- Java Development Kit (JDK) installed (Jenkins requires Java 11 or newer)

## Step 1: Update System Packages

Before installing Jenkins, update your system package list.

```bash
sudo apt update && sudo apt upgrade -y
```

## Step 2: Install Java

Jenkins requires Java to run. Install the OpenJDK package.

```bash
sudo apt install openjdk-11-jdk -y
```

Verify the installation by checking the Java version.

```bash
java -version
```

## Step 3: Add Jenkins Repository

To install Jenkins, you need to add the official Jenkins repository to your system.

1. Download and store the Jenkins GPG key:

```bash
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
```

2. Add the Jenkins repository to your system's sources list:

```bash
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
```

## Step 4: Install Jenkins

Now, update your package list and install Jenkins.

```bash
sudo apt-get update
sudo apt-get install jenkins
```

## Step 5: Start and Enable Jenkins

Start the Jenkins service and enable it to start on boot.

```bash
sudo systemctl start jenkins
sudo systemctl enable jenkins
```

Check the status of Jenkins to ensure it's running:

```bash
sudo systemctl status jenkins
```

## Step 6: Access Jenkins

By default, Jenkins runs on port 8080. Open a web browser and navigate to:

```
http://your_server_ip_or_domain:8080
```

## Step 7: Unlock Jenkins

The initial setup requires a one-time unlock. To retrieve the password, run:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Copy the password and paste it into the Jenkins web interface.

## Step 8: Complete the Setup

After unlocking Jenkins, you'll be prompted to install plugins and create an admin user. Follow the on-screen instructions to complete the installation.

## Troubleshooting

### Missing GPG Key

If you encounter issues with a missing GPG key during the repository setup, ensure that you have correctly imported the key using the `wget` command.

### Jenkins Fails to Start

If Jenkins fails to start after installation, check the service status and logs:

```bash
sudo systemctl status jenkins
sudo journalctl -xe
```

Make sure that Java is properly installed and accessible.

