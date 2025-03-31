contract MapDeepEqualsOrderTest {
    receive() {
        // Test deep equality of two maps inserted in different orders
        let m1: map<Int, Int> = emptyMap();
        m1.set(1, 10);
        m1.set(2, 20);
        m1.set(3, 30);

        let m2: map<Int, Int> = emptyMap();
        m2.set(3, 30);
        m2.set(2, 20);
        m2.set(1, 10);

        dump(m1.deepEquals(m2)); // Expected output: true
    }
}
