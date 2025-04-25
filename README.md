# plp-Database-group581-assignment

# E-commerce Database Design
This project defines a comprehensive and scalable MySQL database schema for an e-commerce platform. It supports key entities like products, brands, categories, variations (size, color, etc.), and extensible product attributes.

## Features
- Structured product catalog with brands and categories
- Support for product variations (size, color, style)
- Customizable product attributes and attribute types
- Hierarchical product categories (nested categories)
- Inventory tracking with product_item
- Image management for products
- Timestamp tracking for auditing and updates
  
## Overview

### `brand`
Stores brand information for products.

### `product_category`
Supports nested categories using `parent_category_id.

### `product`
Defines base product information including price, brand, and category.

### `size_category` & `size_option`
Support for size classification and specific size values (e.g., S, M, L).

### `color`
Color options with optional hex codes for UI display.

### `product_variation`
Captures variations by type (e.g., size, color, style) and their values.

### `product_item`
Represents SKUs or physical inventory items with quantity and price.

### `product_image`
Supports multiple images per product with primary flag and display order.

### `attribute_category` & `attribute_type`
Allow grouping and typing of dynamic product attributes.

### `product_attribute`
Stores attribute values per product (e.g., material, warranty, etc.).

## Collaborators
- Cynthia Mwaura
- Valery Akinyi
- Niver Ngeywo
- Mahlatse Mokhabela
