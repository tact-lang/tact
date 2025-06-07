contract ConstEval2 {
    // Testing compile-time evaluation of crc32 built-in function
    // According to the docs, crc32("000DEADBEEF000") should evaluate to 1821923098.
    const A: Int = crc32("000DEADBEEF000");

    receive() {
        // Reference the constant to ensure it is compiled
        let z: Int = self.A;
        // Use constant in a no-op manner
        cashback(sender());
    }
}
