trait MyTrait {
    // Abstract function requires overriding in inheriting contracts
    abstract fun abstractF(): Int;

    // Virtual function can be overridden
    virtual fun virtualF(): Int {
        return 1;
    }

    // Abstract constant must be defined in the contract
    abstract const A: Int;

    // Virtual constant can be overridden, but has a default
    virtual const B: Int = 5;
}

contract TestContract() with MyTrait {
    // Override abstract constant
    override const A: Int = 10;
    // Override virtual constant
    override const B: Int = 20;

    // Override abstract function
    override fun abstractF(): Int {
        return 100;
    }

    // Override virtual function
    override fun virtualF(): Int {
        return 200;
    }

    // A receiver function to ensure the contract gets compiled
    receive() {}
}
