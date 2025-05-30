contract TestBuiltTime() {
    // Using built-in compile-time evaluation in constant expressions
    const VAL1: Int = ton("1");         // expected: 1000000000
    const VAL2: Int = ascii("⚡");        // expected: 14850721
    // Instead of referring to VAL1 and VAL2 in COMBINED, we perform the operations inline
    const COMBINED: Int = ton("1") + ascii("⚡");       // expected: 1014850721

    // Getter to expose the computed constant
    get fun getCombined(): Int {
        return self.COMBINED;
    }

    // Dummy receive function to ensure the contract is fully compiled
    receive() {
        cashback(sender());
    }
}
