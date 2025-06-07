contract Test {
    // Testing compile-time function 'ton' with valid input "0.1".
    // Expected behavior: successful compile-time conversion of "0.1" Toncoin to nanoToncoins (which equals 10^8).
    value: Int = ton("0.1");

    receive() {}
}
