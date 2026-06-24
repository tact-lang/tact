trait TraitA {
    virtual fun f(x: Int): Int {
        return x + 10;
    }
    abstract fun foo(x: Int): Int;
}

trait TraitB {
    virtual fun f(x: Int): Int {
        return x * 10;
    }
    abstract fun foo(x: Int): Int;
}

contract Combined() with TraitA, TraitB {
    // Overriding f and foo as required by both traits
    override fun f(x: Int): Int {
        // Choose one implementation for simplicity
        return x + 10;
    }

    override fun foo(x: Int): Int {
        return x - 5;
    }

    // A dummy receiver to invoke the functions and ensure they are linked
    receive() {
        let result1 = self.f(5);
        let result2 = self.foo(20);
        // For testing purposes, send a message containing both results
        // Since Tact doesn't support string concatenation, we simply dump one value
        dump(result1 + result2); // Expected: (5+10) + (20-5) = 15 + 15 = 30

        cashback(sender());
    }
}
