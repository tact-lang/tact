trait X {
    // Virtual constant with default value
    virtual const C: Int = 100;

    // Virtual function that returns the value of constant C
    virtual fun getC(): Int {
        return self.C;
    }
}

contract Y() with X {
    // Override the virtual constant
    override const C: Int = 250;

    receive() {
        let value = self.getC(); // Expected: 250
        cashback(sender());
    }
}
