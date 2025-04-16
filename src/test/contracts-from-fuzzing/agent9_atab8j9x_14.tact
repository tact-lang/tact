contract Test {
    // Test Case 20 – ton with leading zero "01"
    // Expectation: This should be accepted and converted appropriately (1 Toncoin => 10^9 nanoToncoins)
    t: Int = ton("01");
}
