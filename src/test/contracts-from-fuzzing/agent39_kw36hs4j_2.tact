trait TraitA {
    // An abstract function that must be overridden
    abstract fun foo(): Int;

    // A concrete function provided by the trait
    fun bar(): Int {
        return 10;
    }
}

trait TraitB {
    // An abstract function that must be overridden
    abstract fun foo(): Int;

    // Another concrete function provided by the trait
    fun baz(): Int {
        return 20;
    }
}

// A contract that inherits from both traits
contract MyContract() with TraitA, TraitB {
    // Override the abstract function. There is only one requirement for 'foo', even though both traits declare it.
    override fun foo(): Int {
        // Call the concrete functions from the inherited traits using 'self'
        return self.bar() + self.baz();
    }

    // A receiver function that is actually invoked in contract execution
    receive() {
        // Call the trait method via self
        let result = self.foo();
        // Dummy usage of result to avoid unused variable warning
        let _ = result;
        return;
    }
}
