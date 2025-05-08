contract TestTon() {
    // Contract-level constant evaluated at compile time: ton("1") should be 1000000000
    const TON_VAL: Int = ton("1");

    receive() {
        // Use self.TON_VAL to access the constant
        dump(self.TON_VAL.toString());
    }
}
