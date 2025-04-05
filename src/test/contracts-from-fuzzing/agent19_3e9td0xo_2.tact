trait MyTrait {
    // Abstract function that must be overridden
    abstract fun doAbstract(): Int;

    // Virtual function with default implementation
    virtual fun doVirtual(): Int {
        return 10;
    }
}

// Contract with no contract fields declared separately (only empty parameters) using inherited trait
contract TestContract() with MyTrait {
    // Override abstract function
    override fun doAbstract(): Int {
        return 42;
    }

    // Override virtual function to change its behavior
    override fun doVirtual(): Int {
        return 100;
    }

    // Receiver function to trigger computation (no persistent storage used for results)
    receive() {
        // Compute sum but do not store it; just call cashback to finalize message processing
        let result = self.doAbstract() + self.doVirtual();
        // For demonstration, we could use the result in some way, but we'll simply drop it
        cashback(sender());
    }

    // Getter function to retrieve the computed result off-chain
    get fun result(): Int {
        return self.doAbstract() + self.doVirtual();
    }
}
