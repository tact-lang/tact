trait TTest {
    // Simple constant and virtual/abstract constants in a trait
    const A: Int = ton("1"); // Expected: 1 Toncoin = 1_000_000_000
    virtual const B: Int = ton("1");
    abstract const C: Int;
}

contract TestTrait() with TTest {
    // Override virtual constant and implement abstract constant
    override const B: Int = ton("0.5"); // Expected: 0.5 Toncoin = 500_000_000
    override const C: Int = ton("2");   // Expected: 2 Toncoin = 2_000_000_000

    receive() {
        // Dump the sum of constant values: 1_000_000_000 + 500_000_000 + 2_000_000_000 = 3_500_000_000
        dump(self.A + self.B + self.C);
    }
}
