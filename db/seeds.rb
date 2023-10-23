require 'faker'

Product.delete_all

# Validation Test
Product.create(
    title: 'Test Product',
    description: "Description of test product",
    price: 12.34,
    # stock_quantity: 50
    )

676.times do |i|
    Product.find_or_create_by(
        title: Faker::Commerce.product_name,
        description: "Product #{i+1}",
        price: Faker::Commerce.price,
        stock_quantity: Faker::Number.digit
    )
end