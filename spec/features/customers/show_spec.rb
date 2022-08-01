require 'rails_helper'

RSpec.describe 'customer show page' do
  it 'shows the list of all of its items and the name of the supermarket it belongs to' do
    supermarket1 = Supermarket.create!(name: "Walmart", location: "Chicago")
    supermarket2 = Supermarket.create!(name: "Target", location: "Atlanta")

    customer1 = Customer.create!(name: "Tyler", supermarket_id: supermarket1.id)
    customer2 = Customer.create!(name: "Jamie", supermarket_id: supermarket2.id)

    item1 = Item.create!(name: "toothpaste", price: 5)
    item2 = Item.create!(name: "bread", price: 2)
    item3 = Item.create!(name: "TV", price: 500)

    customeritem1 = CustomerItem.create!(customer_id: customer1.id, item_id: item1.id)
    customeritem2 = CustomerItem.create!(customer_id: customer1.id, item_id: item2.id)
    customeritem3 = CustomerItem.create(customer_id: customer2.id, item_id: item3.id)

    visit "/customers/#{customer1.id}"
    expect(current_path).to eq("/customers/#{customer1.id}")
    expect(page).to have_content("Walmart")
    expect(page).to have_content("toothpaste")
    expect(page).to have_content("bread")
    expect(page).to_not have_content("Jamie")
    expect(page).to_not have_content("Target")
    expect(page).to_not have_content("TV")
  end

  it 'has the total price of the customers items' do
    supermarket1 = Supermarket.create!(name: "Walmart", location: "Chicago")
    supermarket2 = Supermarket.create!(name: "Target", location: "Atlanta")

    customer1 = Customer.create!(name: "Tyler", supermarket_id: supermarket1.id)
    customer2 = Customer.create!(name: "Jamie", supermarket_id: supermarket2.id)

    item1 = Item.create!(name: "toothpaste", price: 5)
    item2 = Item.create!(name: "bread", price: 2)
    item3 = Item.create!(name: "TV", price: 500)

    customeritem1 = CustomerItem.create!(customer_id: customer1.id, item_id: item1.id)
    customeritem2 = CustomerItem.create!(customer_id: customer1.id, item_id: item2.id)
    customeritem3 = CustomerItem.create(customer_id: customer2.id, item_id: item3.id)
    visit "/customers/#{customer1.id}"

    expect(current_path).to eq("/customers/#{customer1.id}")
    expect(page).to have_content("Total = 7")
  end
end
