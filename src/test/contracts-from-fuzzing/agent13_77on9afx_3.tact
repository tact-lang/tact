contract TestAscii() {
    // Testing compile-time evaluation of ascii() built-in function
    const TEST_ASCII: Int = ascii("⚡");

    fun showcase() {
        dump(self.TEST_ASCII == 14850721);
    }

    receive() {
        self.showcase();
        cashback(sender());
    }
}
