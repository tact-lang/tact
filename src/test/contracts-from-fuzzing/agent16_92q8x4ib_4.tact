trait MyTrait {
    // Virtual function can be overridden by inheriting contracts
    virtual fun greet(): String {
        return "Hello from Trait";
    }

    // Abstract function must be implemented by inheriting contracts
    abstract fun additional(): String;
}

contract MyContract() with MyTrait {
    // Override the virtual function
    override fun greet(): String {
        return "Hello from Contract";
    }

    // Provide implementation for the abstract function without string concatenation
    override fun additional(): String {
        // Instead of concatenating, we return a full literal
        return "Hello from Contract and Additional";
    }

    // A minimal receiver to invoke the functions
    receive() {
        let result = self.additional();
        dump(result);
        cashback(sender());
    }
}
