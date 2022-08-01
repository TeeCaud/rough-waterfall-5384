require 'rails_helper'

RSpec.describe 'supermarket show page' do
  it 'shows the name of the supermarket, with a link to view all of the items. When I click the link I am taken to the supermarkets index page, with a list of unique items for that supermarket' do

    supermarket1 = Supermarket.create!(name: "Walmart", location: "Chicago")
    supermarket2 = Supermarket.create!(name: "Target", location: "Atlanta")

    customer1 = Customer.create!(name: "Tyler", supermarket_id: supermarket1.id)
    customer2 = Customer.create!(name: "Jamie", supermarket_id: supermarket1.id)

    item1 = Item.create!(name: "toothpaste", price: 5)
    item2 = Item.create!(name: "bread", price: 2)
    item3 = Item.create!(name: "TV", price: 500)
    item4 = Item.create!(name: "toothpaste", price: 6)
    item5 = Item.create!(name: "bread", price: 4)

    customeritem1 = CustomerItem.create!(customer_id: customer1.id, item_id: item1.id)
    customeritem2 = CustomerItem.create!(customer_id: customer1.id, item_id: item2.id)
    customeritem3 = CustomerItem.create!(customer_id: customer1.id, item_id: item3.id)
    customeritem4 = CustomerItem.create!(customer_id: customer1.id, item_id: item3.id)
    customeritem5 = CustomerItem.create!(customer_id: customer1.id, item_id: item1.id)

    visit "/supermarkets/#{supermarket1.id}"
    expect(current_path).to eq("/supermarkets/#{supermarket1.id}")
    expect(page).to have_content("Walmart")
    expect(page).to_not have_content("Target")
    expect(page).to have_link("View all Items")
    click_link "View all Items"

    expect(current_path).to eq("/supermarkets/#{supermarket1.id}/items")

    within '#item-0' do
      expect(page).to have_content("toothpaste")
    end
    within '#item-1' do
      expect(page).to have_content("bread")
    end
    within '#item-2' do
      expect(page).to have_content("TV")
    end
  end
end
