trait A {
    // Abstract function that must be overridden by any contract using trait A
    abstract fun foo(): Int;
    
    // Defines a concrete method that uses the overridden foo()
    fun bar(): Int {
        return self.foo() + 1;
    }
}

contract B() with A {
    // Overriding abstract method from trait A
    override fun foo(): Int {
        return 40;
    }

    receive() {
        // Using self.bar() to trigger the trait method
        let x = self.bar();
        require(x == 41, "Unexpected result");
    }
}
