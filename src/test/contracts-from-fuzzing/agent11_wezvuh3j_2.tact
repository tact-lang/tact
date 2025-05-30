trait TraitA {
    // Abstract function, must be overridden
    abstract fun f(): Int;
    // Virtual function with default implementation
    virtual fun g(): Int {
        return 1;
    }
}

trait TraitB {
    // Virtual function with default implementation conflicting with TraitA
    virtual fun g(): Int {
        return 2;
    }
}

contract TestContract() with TraitA, TraitB {
    // Override the abstract function from TraitA
    override fun f(): Int {
        return 42;
    }
    // Override the conflicting virtual function to resolve ambiguity
    override fun g(): Int {
        return 100;
    }
    
    receive() {
        // Dummy receiver to ensure the contract is compiled
    }
}
