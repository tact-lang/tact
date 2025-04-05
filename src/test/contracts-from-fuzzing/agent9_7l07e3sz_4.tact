trait TraitX {
    // Abstract function: must be overridden
    abstract fun abstractFun(x: Int): Int;

    // Virtual function with default implementation
    virtual fun virtualFun(x: Int): Int {
        return x * 2;
    }
}

contract TestContract(a: Int) with TraitX {
    // Override the abstract function: returns x + self.a
    override fun abstractFun(x: Int): Int {
        return x + self.a;
    }

    // Override the virtual function: returns x * 3
    override fun virtualFun(x: Int): Int {
        return x * 3;
    }

    receive() {
        // When the contract receives a message, call both functions via self
        let r1 = self.abstractFun(5); // expecting 5 + a
        let r2 = self.virtualFun(5);  // expecting 15 (if a doesn't affect virtualFun, then it's 15 because 5*3=15)
        dump(r1);
        dump(r2);
        cashback(sender());
    }
}
