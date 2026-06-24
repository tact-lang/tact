trait ConstTest {
    // Virtual constant with default value
    virtual const VAL: Int = 20;

    // A function that adds 5 to the constant
    fun plusFive(): Int {
        return self.VAL + 5;
    }
}

contract TestC() with ConstTest {
    // Override the virtual constant with a literal value
    override const VAL: Int = 15;

    receive() {
        // Expected: 15 + 5 = 20
        dump(self.plusFive());
    }
}
