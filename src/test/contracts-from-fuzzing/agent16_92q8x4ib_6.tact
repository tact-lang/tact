trait MyTrait {
    // Virtual function can be overridden by inheriting contracts
    virtual fun calc(): Int {
        return 1;
    }

    // Abstract function must be implemented by inheriting contracts
    abstract fun add(x: Int): Int;
}

// The contract parameter 'initial' becomes a persistent state variable
contract MyContract(initial: Int) with MyTrait {
    // Override the virtual function
    override fun calc(): Int {
        return 2;
    }

    // Implement the abstract function using self.calc()
    override fun add(x: Int): Int {
        return self.calc() + x;
    }

    // A minimal receiver to invoke the functions
    receive() {
        let result = self.add(self.initial);
        dump(result); // Expected: 2 + initial
        cashback(sender());
    }
}
