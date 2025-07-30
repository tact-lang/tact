trait TestTrait {
    const A: Int = 10;         // trait-level constant
    abstract const B: Int;       // must be defined by contract
    virtual const C: Int = 20;    // can be overridden
}

contract TestContract() with TestTrait {
    // Override the abstract constant
    override const B: Int = 5;
    // Override the virtual constant
    override const C: Int = 30;

    fun testConstants(): Int {
        return self.A + self.B + self.C; // expected: 10 + 5 + 30 = 45
    }

    receive() {
        dump(self.testConstants());
    }
}
