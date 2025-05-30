trait MyTrait {
    // An abstract function that must be implemented by the contract
    abstract fun foo(): Int;

    // A virtual function that uses foo()
    virtual fun bar(): Int {
        return self.foo() + 1;
    }
}

contract TestContract(x: Int) with MyTrait {
    // Override the abstract function from MyTrait using the contract parameter x
    override fun foo(): Int {
        return self.x;
    }

    receive() {
        // Calling the functions to check inheritance interaction
        let a: Int = self.foo();       // Expected to be self.x
        let b: Int = self.bar();         // Expected to be self.x + 1
        let _ = a + b;                 // Dummy usage
    }
}
