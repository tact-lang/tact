trait A {
    // Abstract function must be overridden in implementing contract
    abstract fun foo(): Int;
    
    // Uses self.foo() to call the polymorphic method
    fun bar(): Int {
        return self.foo() + 1;
    }
}

contract B() with A {
    // Override abstract method from trait A
    override fun foo(): Int {
        return 40;
    }
    
    receive() {
        // Call the trait method via self
        let x = self.bar();
        require(x == 41, "Unexpected result");
    }
}
