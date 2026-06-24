contract Test {
    // Test Case 23 – ton with dangling decimal point "1."
    // Expectation: Likely invalid, so compile-time error
    t: Int = ton("1.");
}
