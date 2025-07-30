trait TraitTest {
    // Abstract constant, must be overridden
    abstract const A: Int;
    // Virtual constant with default value that can be overridden
    virtual const B: Int = 10;

    // A function that returns the sum of the constants
    fun calc(): Int {
        return self.A + self.B;
    }
}

contract TestContract() with TraitTest {
    // Overriding the abstract constant
    override const A: Int = 5;
    // Overriding the virtual constant
    override const B: Int = 15;

    // A receiver function that calls calc and dumps the result
    receive() {
        let result = self.calc();
        // The expected result is 5 + 15 = 20
        dump(result);
        cashback(sender());
    }
}
