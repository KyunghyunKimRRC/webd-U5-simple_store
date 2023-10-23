require 'faker'
require 'csv'

Product.delete_all
Category.delete_all

# # Validation Test
# Product.create(
#     title: 'Test Product',
#     description: "Description of test product",
#     price: 12.34,
#     # stock_quantity: 50
#     )

# Populate using Faker
# 676.times do |i|
#     Product.find_or_create_by(
#         title: Faker::Commerce.product_name,
#         description: "Product #{i+1}",
#         price: Faker::Commerce.price,
#         stock_quantity: Faker::Number.digit
#     )
# end

# Populate using CSV
csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true, encoding: 'iso-8859-1')

products.each do |product|
    category = Category.find_or_create_by(name: product['category'])
    Product.find_or_create_by(
        title: product['name'],
        description: product['description'],
        price: product['price'],
        stock_quantity: product['stock quantity'],
        category: category
    )
end