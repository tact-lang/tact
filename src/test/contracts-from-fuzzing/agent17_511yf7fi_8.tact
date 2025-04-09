contract TestMapDeepEquals {
    receive() {
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();

        // Set identical key-value pairs
        m1.set(1, 2);
        m2.set(1, 2);

        // Perform deep equality check
        let areEqual: Bool = m1.deepEquals(m2);
    }
}
