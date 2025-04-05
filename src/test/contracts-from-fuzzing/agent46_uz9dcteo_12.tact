contract TestCombinedConstants() {
    // Combining two compile-time evaluations: ton("1") and ascii("⚡")
    // Expected: ton("1") should be 1000000000 and ascii("⚡") should be 14850721,
    // so the sum should be 1000000000 + 14850721 = 1014850721
    const A: Int = ton("1") + ascii("⚡");

    fun showcase() {
        dump(self.A);
    }

    receive() {
        self.showcase();
        return;
    }
}
