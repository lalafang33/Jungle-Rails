require "rails_helper"

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

      it 'should validate product' do
        category = Category.create(name:'test')
        product = Product.create(name: 'test', price_cents: 1, quantity: 1, category: category)
        expect(product).to be_valid
      end
      it 'should validate name' do
        category = Category.create(name:'test')
        product = Product.create(name:nil, price_cents: 1, quantity: 1, category: category)
        expect(product.valid?).to be false
        puts product.errors.full_messages
      end
      it 'should validate price' do

        category = Category.create(name:'test')
        product = Product.create(name:'test', price_cents: nil, quantity: 1, category: category)
        puts product.errors.full_messages
        expect(product.valid?).to be false
      end
      it 'should validate quantity' do 

        category = Category.create(name:'test')
        product = Product.create(name:'test', price_cents:1, quantity: nil, category: category )
        expect(product.valid?).to be false
        puts product.errors.full_messages
    end
    it 'should validate category' do 

      category = Category.create(name:'test')
      product = Product.create(name:'test', price_cents:1, quantity: 1, category: nil )
      expect(product.valid?).to be false
      puts product.errors.full_messages
    end
  end
end