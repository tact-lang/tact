contract Test {
    receive() {
        // Deep equality test with maps populated in different orders
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();

        m1.set(3, 30);
        m1.set(1, 10);
        m1.set(2, 20);

        m2.set(1, 10);
        m2.set(2, 20);
        m2.set(3, 30);

        let deepEqual: Bool = m1.deepEquals(m2);
        dump(deepEqual); // Expected output: true
    }
}
