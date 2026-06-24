contract Test {
    // Test ton() with valid and invalid Toncoin value strings
    one: Int = ton("1");       // should compile (1 Toncoin = 10^9 nanoToncoins)
    tenth: Int = ton("0.1");   // should compile (0.1 Toncoin = 10^8 nanoToncoins)

    // This should trigger a compile-time error if negative values are not allowed
    neg: Int = ton("-0.1");

    // A valid receive function to complete the contract structure
    receive () {}
}
