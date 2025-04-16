trait MyTraitTest {
    // A trait-level constant computed at compile time using ton("1")
    const base: Int = ton("1");

    // Abstract constant that must be overridden in contracts
    abstract const mustOverride: Int;
}

contract TestTraitConstant() with MyTraitTest {
    // Override the abstract constant; ton("0.5") evaluates to 500000000
    override const mustOverride: Int = ton("0.5");

    // Getter returns the sum of trait constants: expected 1000000000 + 500000000 = 1500000000
    get fun getTraitConstant(): Int {
        return self.base + self.mustOverride;
    }
}
