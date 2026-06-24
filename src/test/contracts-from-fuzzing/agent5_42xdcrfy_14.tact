contract ConstantTest {
    // Constant expression using arithmetic and bitwise operators
    // (10 + 2) * 3 = 36, ~5 equals -6, so COMBINED = 36 - (-6) = 42
    const COMBINED: Int = (10 + 2) * 3 - (~5);

    fun test(): Int {
        return self.COMBINED;
    }

    receive() {
        self.test();
    }
}
