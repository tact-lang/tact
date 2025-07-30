contract TestTonValid {
    // Valid test cases for compile-time function: ton(string): Int
    // According to docs: "1" becomes 10^9, "0.1" becomes 10^8, "0.000000001" becomes 1
    one: Int = ton("1");            // should represent 10^9 nanoToncoins
    pointOne: Int = ton("0.1");      // should represent 10^8 nanoToncoins
    nano: Int = ton("0.000000001");  // should represent 1 nanoToncoin

    receive () {}
}
