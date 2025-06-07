trait TraitA {
    // Abstract constant must be defined by the inheriting contract
    abstract const X: Int;

    // Virtual constant with a default value
    virtual const Y: Int = 100;

    // A function that returns the sum of the constant values
    fun sum(): Int {
        return self.X + self.Y;
    }
}

contract TestContract() with TraitA {
    // Override the abstract constant and virtual constant with literal values
    override const X: Int = 50;
    override const Y: Int = 150;

    receive() {
        let s = self.sum();
        dump(s);
    }
}
