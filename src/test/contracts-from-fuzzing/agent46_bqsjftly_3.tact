trait A {
    // Abstract function requires overriding
    abstract fun abstractFunc(x: Int): Int;

    // Virtual function with default implementation
    virtual fun virtualFunc(x: Int): Int {
        return x + 10;
    }

    // Abstract constant: must be overridden
    abstract const constX: Int;

    // Virtual constant with default value
    virtual const constY: Int = 50;
}

contract C() with A {
    // Override the abstract function
    override fun abstractFunc(x: Int): Int {
        return x * self.constX;
    }

    // Override virtual function
    override fun virtualFunc(x: Int): Int {
        return x + self.constY;
    }

    // Override abstract constant
    override const constX: Int = 3;

    // Override virtual constant
    override const constY: Int = 100;

    // Getter to check behavior
    get fun result(): Int {
        return self.abstractFunc(2) + self.virtualFunc(5);
        // Expected: abstractFunc(2) = 2 * 3 = 6; virtualFunc(5) = 5 + 100 = 105; sum = 111
    }
}
