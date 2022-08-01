require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items}
    it { should have_many(:items).through(:customer_items)}
  end

  describe 'model methods' do
    it ' has a total price of all of its items' do
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

      expect(customer1.total_price).to eq(7)
    end
  end
end
