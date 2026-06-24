trait CounterTrait {
    // Abstract function: must be implemented by the contract
    abstract fun inc(): Int;

    // Virtual function: returns the result of inc() plus one
    virtual fun getValue(): Int {
        return self.inc() + 1;
    }
}

// Contract that declares its persistent state variables in the parameter list.
// In Tact, persistent state variables are typically declared as contract parameters.
// Here, we have two parameters: 'initial' (used only at deployment, for testing purposes) and 'counter' (the mutable state).
contract MyCounter(initial: Int, counter: Int) with CounterTrait {
    // Override abstract function 'inc': increment the counter and return its new value
    override fun inc(): Int {
        // Update the persistent state variable 'counter'
        self.counter += 1;
        return self.counter;
    }

    // Minimal receiver function required for compilation
    receive() {
        // No operation
    }

    // Getter function to access the computed value: should return (inc() + 1)
    get fun current(): Int {
        return self.getValue();
    }
}
