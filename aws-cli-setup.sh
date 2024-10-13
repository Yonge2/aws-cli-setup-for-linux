# Check aws-cli command
aws --version &>/dev/null

if [ $? -ne 0 ]; then
    # Remove files that may exist
    sudo rm -rf /usr/local/aws-cli/ /usr/local/bin/aws /usr/local/bin/aws_completer

    echo "Installing aws-cli..."
    CPU_ARCHITECTURE=$(uname -m)
    curl "https://awscli.amazonaws.com/awscli-exe-linux-$CPU_ARCHITECTURE.zip" -o awscliv2.zip

    unzip -o awscliv2.zip 1>/dev/null

    sudo ./aws/install

    if [ $? -eq 0 ]; then
        echo "Installation aws-cli completed."
    else
        echo "Installation aws-cli failed."
    fi

    rm -rf awscliv2.zip aws
else
    ech "Already installed"
fi
