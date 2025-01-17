require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :customers }
  end

  describe 'methods' do
    it 'has a list of unique items by name' do
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

    expect(supermarket1.unique_items).to eq(["toothpaste", "bread", "TV"])
    end
  end
end
