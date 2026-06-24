trait T1 {
    // Abstract function that must be overridden
    abstract fun foo(): Int;
    
    // Concrete function that calls abstract foo() via explicit self reference
    fun bar(): Int {
        return self.foo() + 1;
    }
}

trait T2 {
    // Virtual function with a default implementation, can be overridden
    virtual fun foo(): Int {
        return 10;
    }
    
    // Another concrete function that calls foo() via self
    fun baz(): Int {
        return self.foo() + 2;
    }
}

contract OV() with T1, T2 {
    // Resolve abstract conflict by overriding foo()
    override fun foo(): Int {
        return 42;
    }
    
    receive() {
        // Calculate sum: foo() + bar() + baz()
        let result = self.foo() + self.bar() + self.baz();
        // Expected: foo() = 42, bar() = 42+1 = 43, baz() = 42+2 = 44, total = 42 + 43 + 44 = 129
        dump(result);
        cashback(sender());
    }
}
