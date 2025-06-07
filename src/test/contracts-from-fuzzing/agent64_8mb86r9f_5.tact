trait MyTestTrait {
    // Abstract function: must be implemented by contract.
    abstract fun foo(): Int;

    // Virtual function with default implementation that uses the abstract function and a virtual constant.
    virtual fun bar(): Int {
        return self.foo() + self.myVirtual;
    }

    // Abstract constant: must be overridden by contract.
    abstract const myAbstract: Int;

    // Virtual constant with a default value.
    virtual const myVirtual: Int = 10;
}

// TestContract defines a persistent state variable 'initial' that is set during deployment.
// It implements the abstract members from MyTestTrait and overrides the virtual constant.
contract TestContract(initial: Int) with MyTestTrait {
    // The constructor parameter 'initial' becomes a persistent field accessible as self.initial.

    // Override abstract constant with a concrete value.
    override const myAbstract: Int = 5;

    // Override virtual constant with a new value.
    override const myVirtual: Int = 20;

    // Override the abstract function foo().
    // It computes a value based on the persistent field 'initial' and the abstract constant.
    override fun foo(): Int {
         return self.initial + self.myAbstract; // = initial + 5
    }

    // A getter that computes the result using both foo() and bar().
    // Expected result: foo() + bar() = (initial+5) + ((initial+5)+20) = 2*initial + 30
    get fun result(): Int {
         return self.foo() + self.bar();
    }

    // A dummy receiver to allow the contract to be deployed and triggered.
    receive() {
         // For example purposes, dump the computed result
         dump(self.result());
         cashback(sender());
    }
}
