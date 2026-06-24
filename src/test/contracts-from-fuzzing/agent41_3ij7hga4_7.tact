contract Test {
    receive() {
        // Test .isEmpty() on an empty map and after insertion
        let m: map<Int, Int> = emptyMap();
        dump(m.isEmpty()); // expected: true
        
        m.set(1, 10);
        dump(m.isEmpty()); // expected: false
        
        // Comparison with null (should be equivalent to isEmpty)
        dump(m == null); // expected: false
    }
}
