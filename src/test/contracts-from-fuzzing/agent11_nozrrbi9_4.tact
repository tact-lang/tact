trait A {
    // Abstract function that must be implemented by inheriting contracts
    abstract fun absFunction(x: Int): Int;

    // Virtual function that can be optionally overridden
    virtual fun virtFunction(x: Int): Int {
        return x * 2;
    }

    // Abstract constant that must be overridden
    abstract const requiredConst: Int;

    // Virtual constant with a default value that can be overridden
    virtual const optionalConst: Int = ton("1");
}

contract C(x: Int) with A {
    // 'x' is a persistent state variable

    // Implement the abstract function
    override fun absFunction(x: Int): Int {
        return x + 10;
    }

    // Override the virtual function
    override fun virtFunction(x: Int): Int {
        return x + 20;
    }

    // Override the abstract constant
    override const requiredConst: Int = 42;

    // Optionally override the virtual constant
    override const optionalConst: Int = ton("2");

    receive() {
        // Use self.x to invoke trait methods
        let a = self.absFunction(self.x);
        let b = self.virtFunction(self.x);
        let rc = self.requiredConst;
        let oc = self.optionalConst;
        // For testing, just perform a cashback
        cashback(sender());
    }
}
