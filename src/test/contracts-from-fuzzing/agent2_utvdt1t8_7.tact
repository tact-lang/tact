contract Test {
    receive() {
        // Test map.deepEquals functionality
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();

        // Set entries in both maps
        m1.set(1, 2);
        m1.set(2, 3);
        m2.set(1, 2);
        m2.set(2, 3);
        
        // Compare using deepEquals; should return true
        let areEqual: Bool = m1.deepEquals(m2);
        if (areEqual) {
            dump(100); // Expected output: 100
        } else {
            dump(0);
        }
    }
}
