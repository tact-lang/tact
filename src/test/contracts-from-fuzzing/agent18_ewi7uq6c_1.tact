trait T1 {
    // Abstract function that must be overridden
    abstract fun foo(x: Int): Int;

    // Virtual function with default implementation, can be overridden
    virtual fun bar(x: Int): Int {
        return x * 2;
    }
}

trait T2 {
    // A concrete function provided by the trait T2
    fun baz(x: Int): Int {
        return x + 10;
    }
}

contract TestContract() with T1, T2 {
    // Overriding the abstract function from T1
    override fun foo(x: Int): Int {
        return x + 1;
    }
    
    // Overriding the virtual function from T1
    override fun bar(x: Int): Int {
        return x + 3;
    }

    // A receiver function to test the trait methods
    receive() {
        // Call the functions and sum the results
        let a = self.foo(10);   // expected 11
        let b = self.bar(10);   // expected 13
        let c = self.baz(10);   // expected 20
        
        // Dump the sum: 11 + 13 + 20 = 44
        dump(a + b + c);

        // Forward any remaining value back to the sender
        cashback(sender());
    }
}
