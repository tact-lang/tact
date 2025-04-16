contract TestTon {
    fun showcase() {
        // Test the ton() function on a constant string literal.
        // Expected behavior: ton("1") should return 1000000000 (1e9) as per documentation.
        dump(ton("1"));
    }

    receive() {
        self.showcase();
    }
}