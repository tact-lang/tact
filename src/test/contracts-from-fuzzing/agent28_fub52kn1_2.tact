trait T1 {
    // Abstract constant that must be overridden by a contract
    abstract const A: Int;
    // Virtual constant with a default value, can be overridden
    virtual const B: Int = 100;
}

contract TestConstants() with T1 {
    // Override the abstract constant
    override const A: Int = 50;
    // Override the virtual constant
    override const B: Int = 200;

    receive() {
        // Compute the sum of the constants
        let sum = self.A + self.B; // Expected: 50 + 200 = 250
        dump(sum);
        return;
    }
}
