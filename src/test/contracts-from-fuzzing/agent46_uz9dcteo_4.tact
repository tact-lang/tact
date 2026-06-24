contract TestTon() {
    // Test constant evaluation of ton built-in compile-time function.
    // According to documentation, ton("1") should evaluate to 1000000000 nanoToncoins.
    const T: Int = ton("1");

    fun showcase() {
        dump(self.T); // Expecting 1000000000
    }

    receive() {
        self.showcase();
        return;
    }
}
