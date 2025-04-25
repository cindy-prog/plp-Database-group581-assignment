-- CREATE DATABASE Ecommercedb;
USE Ecommercedb;

CREATE TABLE brand (

brand_Id INT PRIMARY KEY AUTO_INCREMENT,
brand_name varchar(100) NOT NULL,
description TEXT,
logo_url varchar(255), 
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp
);
CREATE TABLE product_category (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL,
  parent_category_id INT NULL,
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (parent_category_id) REFERENCES product_category(category_id)
);
CREATE TABLE product (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(255) NOT NULL,
  description TEXT,
  brand_id INT NOT NULL,
  category_id INT NOT NULL,
  base_price DECIMAL(10,2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
  FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);
CREATE TABLE size_category (
  size_category_id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(50) NOT NULL,
  description VARCHAR(255)
);
CREATE TABLE size_option (
  size_id INT AUTO_INCREMENT PRIMARY KEY,
  size_category_id INT NOT NULL,
  size_value VARCHAR(20) NOT NULL,
  size_order INT,
  FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);
CREATE TABLE color (
  color_id INT AUTO_INCREMENT PRIMARY KEY,
  color_name VARCHAR(50) NOT NULL,
  hex_code VARCHAR(7),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE product_variation (
  variation_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT NOT NULL,
  variation_type ENUM('size', 'color', 'style') NOT NULL,
  variation_value VARCHAR(50) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);
CREATE TABLE product_item (
  item_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT NOT NULL,
  sku VARCHAR(50) NOT NULL UNIQUE,
  price DECIMAL(10,2) NOT NULL,
  quantity_in_stock INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);
CREATE TABLE product_image (
  image_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT NOT NULL,
  image_url VARCHAR(255) NOT NULL,
  alt_text VARCHAR(255),
  is_primary BOOLEAN DEFAULT FALSE,
  display_order INT DEFAULT 0,
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);
CREATE TABLE attribute_category (
  attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL,
  description TEXT
);
CREATE TABLE attribute_type (
  attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,
  type_name VARCHAR(50) NOT NULL,
  data_type ENUM('text', 'number', 'boolean', 'date') NOT NULL
);
CREATE TABLE product_attribute (
  attribute_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT NOT NULL,
  attribute_category_id INT NOT NULL,
  attribute_type_id INT NOT NULL,
  attribute_name VARCHAR(100) NOT NULL,
  attribute_value TEXT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
  FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);