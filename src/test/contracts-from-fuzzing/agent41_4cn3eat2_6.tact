contract TestTonInvalid() {
    // Attempt to compute constant using ton with an invalid string format "1.0"
    // According to documentation, ton expects a string representing an integer (in nanoToncoin representation).
    // This is expected to produce a compile-time error.
    const INVALID_TON: Int = ton("1.0");

    receive() {
        // Unreachable, but needed for contract completeness
    }
}
