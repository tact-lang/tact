trait MyTrait {
    // Abstract function: must be overridden by the inheriting contract
    abstract fun absF(x: Int): Int;

    // Virtual function with default implementation, override optional
    virtual fun virtF(x: Int): Int {
        return x * 2;
    }

    // Abstract constant: must be defined by the inheriting contract
    abstract const absConst: Int;

    // Virtual constant with default value, override optional
    virtual const virtConst: Int = 10;
}

contract TestContract(owner: Address) with MyTrait {
    // Override the abstract function
    override fun absF(x: Int): Int {
        return x + 1;
    }

    // Override the virtual function
    override fun virtF(x: Int): Int {
        return x * 3;
    }

    // Override abstract constant and virtual constant
    override const absConst: Int = 5;
    override const virtConst: Int = 20;

    receive() {
        // Use the trait functions and constants
        let a = self.absF(10);    // expected 11
        let b = self.virtF(10);   // expected 30
        let c = self.absConst;    // expected 5
        let d = self.virtConst;   // expected 20
        // For testing purposes, we just perform these computations
        // and then perform a dummy cashback to complete execution.
        cashback(sender());
    }
}
