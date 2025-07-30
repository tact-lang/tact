contract Test {
    // Test .replace() and .del() and deletion via setting null
    receive() {
        // Create a local map for Int to Int
        let m: map<Int, Int> = emptyMap();
        
        // Set a key-value pair
        m.set(5, 55);
        
        // Test replace(): replace an existing entry
        let rep1: Bool = m.replace(5, 60);
        dump(rep1); // Expected: true (key 5 exists and is replaced)
        
        // Test replace(): attempt to replace non-existent key
        let rep2: Bool = m.replace(10, 100);
        dump(rep2); // Expected: false (key 10 does not exist)
        
        // Test deletion via .set() with null
        m.set(5, null); // should delete key 5
        if (m.get(5) == null) {
            dump(1); // Expected: 1 (entry deleted successfully)
        } else {
            dump(0);
        }
    }
}
