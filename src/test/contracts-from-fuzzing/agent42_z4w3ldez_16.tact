trait DoubleTrait {
    // Declare field x in the trait
    x: Int;
    
    // Function doubleX that uses field x
    fun doubleX(): Int {
        return self.x * 2;
    }
}

// Contract HasX that implements field x via constructor parameter and inherits DoubleTrait
contract HasX(x: Int) with DoubleTrait {
    // Since the trait declares x, the contract's parameter x initializes self.x automatically
    // (contract parameters are merged with trait fields if names match)

    receive() {
        dump(self.doubleX());
        cashback(sender());
    }
}
