resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "nat"
  }
}

resource "aws_nat_gateway" "nat-1" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-ap-south-1a.id

  tags = {
    Name = "nat"
  }

  depends_on = [aws_internet_gateway.igw]
}