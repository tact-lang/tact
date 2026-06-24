contract TestDel {
    receive() {
        // Initialize a map of Int to Int
        let m: map<Int, Int> = emptyMap();
        
        // Set entries under keys 7 and 42
        m.set(7, 123);
        m.set(42, 321);
        
        // Delete the entry at key 7 (should succeed)
        let del1: Bool = m.del(7);
        dump(del1); // expected: true
        
        // Attempt to delete key 7 again (should fail)
        let del2: Bool = m.del(7);
        dump(del2); // expected: false
        
        // Check existence of key 42 (should exist)
        if (m.exists(42)) {
            dump(m.get(42)!!); // expected: 321
        } else {
            dump(0);
        }
        
        // Delete key 42 by setting its value to null
        m.set(42, null);
        dump(m.exists(42)); // expected: false
        
        // Test isEmpty: reassign map to emptyMap (or null)
        let empty: map<Int, Int> = emptyMap();
        if (empty.isEmpty()) {
            dump(100);
        } else {
            dump(0);
        }
    }
}
