resource "aws_instance" "webapps" {
     ami = data.aws_ami.windows.id
     instance_type = "t2.micro"
     availability_zone = var.availability_zone

lifecycle {
     ignore_changes = [ami]
     }
 }

#AMI Filter for Windows Server 2019 Base
data "aws_ami" "windows" {
     most_recent = true
     filter {
        name   = "name"
        values = ["amzn2-ami-kernel-5.10-hvm-2.0.*"] ##amzn2-ami-kernel-5.10-hvm-2.0.20220912.1-x86_64-gp2
 }
     filter {
       name   = "virtualization-type"
       values = ["hvm"]
 }
     owners = ["137112412989"] # Canonical
 }
 
 resource "aws_ebs_volume" "webebs" {
     availability_zone = var.availability_zone
     size             = 40
}
resource "aws_volume_attachment" "ebs_attached" {
     device_name = "/dev/sdh"
     volume_id   = aws_ebs_volume.webebs.id
     instance_id = aws_instance.webapps.id
}

resource "aws_cloudwatch_metric_alarm" "ec2_cpu" {
     alarm_name               = "cpu-utilization"
     comparison_operator       = "GreaterThanOrEqualToThreshold"
     evaluation_periods       = "2"
     metric_name               = "CPUUtilization"
     namespace                 = "AWS/EC2"
     period                   = "120" #seconds
     statistic                 = "Average"
     threshold                 = "80"
   alarm_description         = "This metric monitors ec2 cpu utilization"
     insufficient_data_actions = []
dimensions = {
       InstanceId = aws_instance.webapps.id
     }
}
