contract Test {
    // Testing compile-time function ton with a valid Toncoin value string
    oneTenth: Int = ton("0.1"); // expecting 10^8 nanoToncoins

    receive () {}
}
