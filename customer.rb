class Customer

    attr_reader :name, :wallet, :age

    def initialize(name, wallet, age)
        @name = name
        @wallet = wallet
        @age = age
        @drunkenness = 0
    end

    def reduce_money_in_wallet(drink)
        @wallet -= drink.price
    end

    def give_drunkenness_level()
        return @drunkenness
    end

    def increase_drunkenness_level(drink)
        return @drunkenness += drink.alcohol_level
    end

end