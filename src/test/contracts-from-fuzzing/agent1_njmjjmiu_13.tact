contract MapDeepEqualsTest {
    receive() {
        // Test deep equality of two maps with identical entries
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        m1.set(1, 10);
        m1.set(2, 20);
        m2.set(1, 10);
        m2.set(2, 20);
        
        // deepEquals should return true, as both maps have the same key-value pairs
        dump(m1.deepEquals(m2)); // Expected output: true
        
        // Shallow equality using '==' may depend on serialization; compare for detection
        dump(m1 == m2); // Output may vary
    }
}
