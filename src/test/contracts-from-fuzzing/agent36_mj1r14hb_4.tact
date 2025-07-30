trait Trait1 {
    // Abstract function that must be implemented
    abstract fun foo(x: Int): Int;

    // Virtual function that can be overridden
    virtual fun bar(x: Int): Int {
        return x * 2;
    }
}

trait Trait2 {
    // Another abstract function that must be implemented
    abstract fun baz(x: Int): Int;
}

contract TestContract() with Trait1, Trait2 {
    // Provide implementation for abstract functions
    override fun foo(x: Int): Int {
        return x + 5;
    }
    
    override fun baz(x: Int): Int {
        return x - 3;
    }

    // Override the virtual function bar
    override fun bar(x: Int): Int {
        return x * 3;
    }

    receive() {
        let a = self.foo(10); // expected 15
        let b = self.bar(10); // expected 30
        let c = self.baz(10); // expected 7
    }
}
