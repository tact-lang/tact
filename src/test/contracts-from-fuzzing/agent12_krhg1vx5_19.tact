contract Test {
    // Fuzz Test G.6: Use ton() with leading zeros in a decimal value
    // Testing if input "000.1" is accepted and correctly converted
    val: Int = ton("000.1");

    receive() {}
}
