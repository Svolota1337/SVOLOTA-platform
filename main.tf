provider "aws" {
    region = "eu-north-1"
}

resource "aws_instance" "SVOLOTA" {
  ami = "ami-07c8c1b18ca66bb07" 
  instance_type = "t3.micro"
  key_name = aws_key_pair.deployer.key_name
  user_data = "${file("UserData.sh")}"
  
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDHcIz8OOq0/8j7noGD18hMPBDw6jLLgxEvzvbKR3GutH/QL9qbcXaQbG/HOJU5eiN94alApeBLyu8ugkLyg5jJEB6IwsNPo4qA1PPYWHIeQu1lo7/nRqW4TCOEWjVl1fegh4vV/5mI2uQ3Yz23qYa4qDRMp3lB5o4pKyClmU2AgO92SXdKgDAeVVF6EkOY4DfmS6iCi7Xtoq3ot7nMXiDmUGeyWFXmvxssEQyKLQN4fS9SCSHHe/l71tPPe3n0EezXnKlMThS8fvl1HCB1T+5r36Chg2HOQaxMVWB7NHob/Kd+3g47YHxOXBzTlKhW9Xq3VSCD7sNdrcIumquX8UNt4l0t+f+0HVtWHIe91MUTTeE0DWyLXOTpTDQ+rDewQi2emp6bAFJeRV3fdGqe997owKk/QtC+42oRN6WEMefO32ndbRpVV5AfygOyEnQoJAHCds14X4q2eJ1ElkxEXw1sLf8Nn441oWuOQjiEzb0GJDWthitdHl5hc/VRyOgCVH8= root@DESKTOP-G39PVJB"
}
