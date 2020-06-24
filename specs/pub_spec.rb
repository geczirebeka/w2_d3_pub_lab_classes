require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')

class TestPub < Minitest::Test

    def setup()
        @customer1 = Customer.new("Alina", 50, 17)
        @customer2 = Customer.new("Rebeka", 45, 24)
        @beer = Drink.new("Lager", 3, 1)
        @gin = Drink.new("Gordons", 4, 3)
        @pimms = Drink.new("Pimm's", 6, 2)
        @drinks = [@beer, @gin, @pimms]
        @pub = Pub.new("Ryrie's", 1500, @drinks)
    end

    def test_pub_has_name
        assert_equal("Ryrie's", @pub.name())
    end

    def test_pub_has_money_in_till()
        assert_equal(1500, @pub.till())
    end

    def test_pub_has_drinks()
        assert_equal(3, @pub.count_drinks())
    end

    def test_increase_till_by_drink_price()
        @pub.increase_till(@gin)
        assert_equal(1504, @pub.till())
    end
    
    def test_can_sell_drink_to_customer_is_old_enough()
        @pub.sell_drink_to_customer(@customer2, @pimms)
        assert_equal(1506, @pub.till())
        assert_equal(39, @customer2.wallet())
    end

    def test_can_sell_drink_to_customer_is_too_young()
        response = @pub.sell_drink_to_customer(@customer1, @pimms)
        assert_equal("You are too young to drink!", response)
        assert_equal(1500, @pub.till())
        assert_equal(50, @customer1.wallet())
    end

    

end