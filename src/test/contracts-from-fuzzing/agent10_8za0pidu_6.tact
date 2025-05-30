trait TraitX {
    // Abstract constant, must be overridden
    abstract const X: Int;
    // Virtual constant with default value
    virtual const Y: Int = 100;
}

trait TraitY {
    // Another virtual constant, same name Y, but different default
    virtual const Y: Int = 200;
}

contract TestConst() with TraitX, TraitY {
    // Override abstract constant
    override const X: Int = 42;
    // Override virtual constant to resolve conflict
    override const Y: Int = 300;

    receive() {
        // Expect 42 + 300 = 342
        dump(self.X + self.Y);
        cashback(sender());
    }
}
