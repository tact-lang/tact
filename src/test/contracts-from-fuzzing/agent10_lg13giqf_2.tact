trait MyTrait {
    // Abstract function that must be overridden
    abstract fun f(): Int;

    // Virtual function with default implementation
    virtual fun g(): Int {
        return 10;
    }

    // Constant defined on the trait
    const CT: Int = 7;

    // Abstract constant that must be provided by the contract
    abstract const CA: Int;

    // Virtual constant that can be overridden
    virtual const CV: Int = 99;
}

contract TestContract(x: Int) with MyTrait {
    // Persistent field x is automatically stored and accessible via self.x

    // Override the abstract function f
    override fun f(): Int {
        return self.x;
    }

    // Override the abstract constant CA
    override const CA: Int = 42;

    // Optionally override the virtual constant CV
    override const CV: Int = 100;

    // A dummy receiver to force compilation and include trait methods and constants
    receive() {
        // Use the trait's functions and constants
        let r = self.f() + self.g() + self.CT + self.CA + self.CV;
        // r is computed but not used further
        return;
    }
}
