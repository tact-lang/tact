trait TraitA {
    // Abstract function requiring override
    abstract fun foo(x: Int): Int;

    // Virtual function with a default implementation
    virtual fun bar(x: Int): Int {
        return x + 1;
    }
}

trait TraitB {
    // Another abstract function
    abstract fun baz(x: Int): Int;
}

contract MyContract() with TraitA, TraitB {
    // Override abstract function from TraitA
    override fun foo(x: Int): Int {
        return x * 2;
    }

    // Override abstract function from TraitB
    override fun baz(x: Int): Int {
        return x - 3;
    }

    // Optionally override the virtual function from TraitA
    override fun bar(x: Int): Int {
        return x + 10;
    }

    receive() {
        // Use the trait functions via self.
        let a = self.foo(5);    // Expected: 5 * 2 = 10
        let b = self.bar(a);    // Expected: 10 + 10 = 20
        let c = self.baz(b);    // Expected: 20 - 3 = 17
        dump(c);
    }
}
