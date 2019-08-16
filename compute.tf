resource "aws_instance" "poc-server" {
	ami="ami-009c174642dba28e4"
	instance_type="t2.micro"
	
	vpc_security_group_ids = [aws_security_group.web-sg.id, aws_security_group.web-ssh.id]

	user_data = <<-EOF
		#! /bin/bash
        #sudo apt-get update
		#sudo apt-get install -y apache2
		#sudo systemctl start apache2
		#sudo systemctl enable apache2
		#echo "<h1>Welcome to Greniu's Web Server</h1>" | sudo tee /var/www/html/index.html
		echo "<h1>Welcome to Greniu's Web Server</h1>" > index.html
        nohup busybox httpd -f -p 8888 &
	EOF

	tags = {
	Name = "Greniu's webserver"
	}
	
}