trait Alpha {
    // Abstract function must be implemented by the inheriting contract
    abstract fun getValue(): Int;

    // Virtual function with default implementation: doubles the value from getValue()
    virtual fun doubleVal(): Int {
        return self.getValue() * 2;
    }
}

trait Beta {
    // Abstract trait-level constant, must be overridden by the contract
    abstract const magic: Int;

    // Virtual trait-level constant with a default value
    virtual const bonus: Int = 10;

    // Function that returns the sum of magic and bonus
    fun combined(): Int {
        return self.magic + self.bonus;
    }
}

contract Combined() with Alpha, Beta {
    // Override abstract function from Alpha using the combined method from Beta
    override fun getValue(): Int {
        return self.combined();
    }

    // Override the abstract constant from Beta
    override const magic: Int = 40;

    // The receive function will dump the computed values
    receive() {
        // Expected getValue: magic + bonus = 40 + 10 = 50
        dump(self.getValue());
        // Expected doubleVal: 50 * 2 = 100
        dump(self.doubleVal());
        // Expected combined: magic + bonus = 40 + 10 = 50
        dump(self.combined());
        cashback(sender());
    }
}
