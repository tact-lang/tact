contract PrimitiveTest {
    // This test validates basic primitive operations: arithmetic and booleans.
    fun test() {
        let sum: Int = 1 + 1;          // Expected: 2
        dump(sum);

        let div: Int = 3 / 2;          // Expected: 1 because division rounds toward -∞
        dump(div);

        let b: Bool = true && false;   // Expected: false
        dump(b);
    }
    receive() {
        self.test();
    }
}
