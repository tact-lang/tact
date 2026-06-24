trait T {
    // Abstract constant: must be overridden
    abstract const a: Int;
    // Virtual constant with default value
    virtual const b: Int = 100;

    // A simple function that adds 10 to b
    fun f(): Int {
        return self.b + 10;
    }
}

contract C() with T {
    // Override abstract constant and virtual constant
    override const a: Int = 50;
    override const b: Int = 200;

    receive() {
        let x = self.f();
        // x should equal 210
        // No further operations; just a dummy receiver
        cashback(sender());
    }
}
