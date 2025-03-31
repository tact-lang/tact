contract Test {
    // Valid usage of compile-time function ton
    one: Int = ton("1");            // 1 Toncoin -> 10^9 nanoToncoins
    pointOne: Int = ton("0.1");      // 0.1 Toncoin -> 10^8 nanoToncoins

    receive() {}
}
