#!/bin/bash

# Update packages
sudo apt-get update -y

# Install Nginx
sudo apt-get install nginx -y

# Enable and start Nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Create a custom HTML page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ShopFusion</title>
<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}
body{
    background:#f5f7fb;
}
header{
    background:#111827;
    color:white;
    padding:20px 60px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}
header h1{
    color:#38bdf8;
}
nav a{
    color:white;
    text-decoration:none;
    margin-left:25px;
    font-weight:bold;
}
.hero{
    height:80vh;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#2563eb,#7c3aed);
    color:white;
    text-align:center;
}
.hero h2{
    font-size:48px;
}
.hero p{
    margin:20px 0;
    font-size:20px;
}
.hero button{
    padding:14px 30px;
    border:none;
    background:#fff;
    color:#2563eb;
    border-radius:8px;
    cursor:pointer;
    font-size:18px;
    font-weight:bold;
}
.products{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:30px;
    padding:60px;
}
.card{
    background:white;
    padding:20px;
    border-radius:12px;
    box-shadow:0 5px 15px rgba(0,0,0,.15);
    text-align:center;
}
.card img{
    width:100%;
    border-radius:10px;
}
.card h3{
    margin:15px 0;
}
.price{
    color:#2563eb;
    font-size:24px;
    font-weight:bold;
}
footer{
    background:#111827;
    color:white;
    text-align:center;
    padding:20px;
    margin-top:40px;
}
</style>
</head>
<body>

<header>
<h1>ShopFusion</h1>
<nav>
<a href="#">Home</a>
<a href="#">Products</a>
<a href="#">About</a>
<a href="#">Contact</a>
</nav>
</header>

<section class="hero">
<h2>Welcome to ShopFusion</h2>
<p>Terraform + AWS EC2 + Nginx Deployment Successfully Completed 🚀</p>
<button>Shop Now</button>
</section>

<section class="products">

<div class="card">
<img src="https://picsum.photos/300/200?random=1">
<h3>Gaming Laptop</h3>
<p class="price">$999</p>
</div>

<div class="card">
<img src="https://picsum.photos/300/200?random=2">
<h3>Smart Watch</h3>
<p class="price">$199</p>
</div>

<div class="card">
<img src="https://picsum.photos/300/200?random=3">
<h3>Wireless Headphones</h3>
<p class="price">$149</p>
</div>

<div class="card">
<img src="https://picsum.photos/300/200?random=4">
<h3>Mobile Phone</h3>
<p class="price">$799</p>
</div>

</section>

<footer>
<h3>Terraform Project | AWS EC2 | Nginx | ShopFusion</h3>
<p>Created by Rameshwar Mane</p>
</footer>

</body>
</html>
EOF

# Restart Nginx
systemctl restart nginx