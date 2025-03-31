contract Test {
    // Test ton() with a valid Toncoin value
    one: Int = ton("1"); // Expected to compile and yield 10^9 nanoToncoins

    receive () {}
}
