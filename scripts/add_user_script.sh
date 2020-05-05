#https://linuxize.com/post/how-to-add-user-to-sudoers-in-ubuntu/
#Create an encrypted password
#Update the password in sudoers
# git clone , clone the scripts folder
#https://dev.to/narongdejsrn/upgrading-php-to-7-3-with-ansible-4fp1

if [ $(id -u) -eq 0 ]; then
	read -p "Enter username : " username
	read -s -p "Enter password : " password
	egrep "^$username" /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo "$username exists!"
		exit 1
	else
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
		useradd -m -p "$pass" "$username"
		[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
		# Update the sudoers
		echo "username  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/username
	fi
else
	echo "Only root may add a user to the system."
	exit 2
fi

`mkdir /home/$username/scripts/`
`git clone https://github.com/sanbabba/devOps_assignment`

`echo "[php_hosts]" >> /etc/ansible/hosts`
`terraform output instance_ips | grep [0-9] >> /etc/ansible/hosts`

`ansible-galaxy install geerlingguy.repo-remi`
`ansible-galaxy install geerlingguy.php-versions`
`ansible-galaxy install geerlingguy.php`
`ansible-playbook install-php.yml`
