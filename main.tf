provider "aws" {
	region = "eu-central-1"
}

resource "aws_instance" "poc-server" {
	ami="ami-0cc293023f983ed53"
	instance_type="t2.micro"

	user_data = <<-EOF
		#! /bin/bash
        sudo apt-get update
		sudo apt-get install -y apache2
		sudo systemctl start apache2
		sudo systemctl enable apache2
		echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
	EOF

	tags = {
	Name = "blablabla"
	}
	

}
