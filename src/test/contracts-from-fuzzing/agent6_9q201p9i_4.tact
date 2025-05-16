contract TestTon() {
    // Constant evaluated at compile-time using the ton built-in function.
    // According to the documentation, ton("1") should produce 1000000000 (1e9).
    const ton_val: Int = ton("1");

    receive() {
        // Access the constant via self
        dump(self.ton_val);
        cashback(sender());
    }
}
