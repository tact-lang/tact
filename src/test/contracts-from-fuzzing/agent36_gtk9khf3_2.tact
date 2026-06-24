trait A {
    // Abstract function f must be overridden
    abstract fun f(x: Int): Int;

    // Virtual function g can be overridden but has a default implementation
    virtual fun g(x: Int): Int {
        return x + 1;
    }

    // Abstract constant must be overridden in inheriting contracts
    abstract const constA: Int;

    // Virtual constant has a default value but can be overridden
    virtual const constB: Int = 100;
}

contract TestContract() with A {
    // Override the abstract function f
    override fun f(x: Int): Int {
        return x * 2;
    }

    // Do not override g; the default from trait A will be used

    // Override the abstract constant constA
    override const constA: Int = 10;

    // Override the virtual constant constB
    override const constB: Int = 200;

    receive() {
        // Test calls to f and g using self
        let resultF = self.f(3);   // expected 6
        let resultG = self.g(3);   // expected 4 (3 + 1)

        // Test accessing constants via self
        let valueA = self.constA; // expected 10
        let valueB = self.constB; // expected 200

        // Dumping values for the sake of testing
        dump(resultF);
        dump(resultG);
        dump(valueA);
        dump(valueB);

        return;
    }
}
