resource "aws_security_group" "web-sg" {
  name        = "webserver-sg-greniu"
  description = "Security group for webserver"

  ingress {
    from_port   = 8888
    to_port     = 8888
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "web-ssh" {
  name        = "web-ssh-sg-greniu"
  description = "Security group for ssh access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}