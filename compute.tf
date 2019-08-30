resource "aws_instance" "poc-server" {
	ami="ami-009c174642dba28e4"
	#ami="ami-0cc293023f983ed53"
	instance_type="t2.micro"
	key_name = "GreniuKP"
	vpc_security_group_ids = [aws_security_group.web-sg.id, aws_security_group.web-ssh.id]
	user_data = <<-EOF
		#! /bin/bash
        
        echo "<h1>Welcome to Tom's POC Web Server</h1>" > index.html
        nohup busybox httpd -f -p 8888 &
	EOF

	tags = {
	Name = "Tom's webserver"
	}
	
}
