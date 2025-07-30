contract Test {
    // Test Case 22 – ton with floating point value '1.0'
    // Expectation: This should convert correctly to 10^9 nanoToncoins
    t: Int = ton("1.0");
}
