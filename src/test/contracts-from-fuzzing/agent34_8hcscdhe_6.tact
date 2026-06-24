contract Test {
    receive() {
        // Test deepEquals: compare two maps with identical key-value pairs
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        m1.set(10, 100);
        m2.set(10, 100);
        let eq: Bool = m1.deepEquals(m2);
        dump(eq); // Expected output: true
    }
}
