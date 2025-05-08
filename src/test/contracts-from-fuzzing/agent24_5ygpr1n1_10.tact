/// Test A (revised): Valid usage of wildcard parameters in a trait definition and proper override

trait WildTrait {
    // In a trait, using '_' for parameters indicates that the values are discarded in the default implementation
    virtual fun doSomething(_: Int, _: Int): Int {
        return 0;
    }
}

contract Impl with WildTrait {
    // Override with proper identifiers (accessing the values)
    override fun doSomething(a: Int, b: Int): Int {
        return a + b;
    }

    receive () {
        // Correctly call the trait function via self
        let res = self.doSomething(10, 20);
        dump(res); // Expected output: 30
    }
}
