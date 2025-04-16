trait TConsts {
    // Abstract constant: must be overridden by inheriting contracts
    abstract const A: Int;

    // Virtual constant with a default value; can be overridden
    virtual const B: Int = 100;
}

contract ConstTest() with TConsts {
    // Override abstract constant
    override const A: Int = 50;

    // Override virtual constant
    override const B: Int = 200;

    receive() {
        // Dump the sum of the constants, expected 50 + 200 = 250
        dump(self.A + self.B);
    }
}
