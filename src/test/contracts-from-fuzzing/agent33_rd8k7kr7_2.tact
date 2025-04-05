contract PrimitiveTest {
    fun test() {
        // According to docs, division rounds toward -∞, so 3/2 should be 1
        let res: Int = 3 / 2;
        dump(res); // Expected output: 1
    }
    receive() {
        self.test();
    }
}
