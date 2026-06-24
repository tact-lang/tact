trait TestTrait {
    // Abstract constant that must be overridden by the contract
    abstract const Val: Int;
    
    // Function that uses the constant
    fun foo(): Int {
        return self.Val * self.Val;
    }
}

contract TestContract() with TestTrait {
    // Override the abstract constant with a concrete value
    override const Val: Int = 7;
    
    // A getter function to compute a value using foo()
    // Expected result: foo() = 7 * 7 = 49
    get fun main(): Int {
        return self.foo();
    }
}
