contract ConstEval {
    // Testing compile-time evaluation of constants using built-in functions
    // ascii("⚡") should evaluate at compile time 14850721, and ton("1") should evaluate to 1000000000.
    const X: Int = ascii("⚡");
    const Y: Int = ton("1");

    // A receiver that uses these constants, ensuring they are compiled
    receive() {
        // Compute a sum with the constants to ensure they are referenced
        let z: Int = self.X + self.Y;
        // Use z in a way that doesn't affect contract behaviour
        cashback(sender());
    }
}
