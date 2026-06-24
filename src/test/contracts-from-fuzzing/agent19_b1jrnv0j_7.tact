contract TestTon {
    // Constant evaluated at compile time using the built-in ton() function.
    // According to documentation, ton("1") returns 1,000,000,000 nanoToncoin.
    const TON_VAL: Int = ton("1");

    receive() {
        // Dump the constant; expected output: 1000000000
        dump(self.TON_VAL);
        cashback(sender());
    }
}
