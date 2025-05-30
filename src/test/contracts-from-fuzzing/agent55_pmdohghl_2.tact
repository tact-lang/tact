trait T1 {
    // Abstract constant
    abstract const X: Int;
    // Non-overridable constant (inherited if not overridden)
    const Y: Int = 10;
    // A virtual constant, overridable in the implementing contract
    virtual const Z: Int = 20;
}

contract C1() with T1 {
    // Override the abstract constant
    override const X: Int = 42;
    // Override the virtual constant
    override const Z: Int = 30;

    get fun sum(): Int {
        // Access the constants defined in the trait
        // Expected sum is 42 + 10 + 30 = 82
        return self.X + self.Y + self.Z;
    }

    // A receiver to force code to be included, though not needed for getter testing
    receive() {
        let _ = self.sum();
        cashback(sender());
    }
}
