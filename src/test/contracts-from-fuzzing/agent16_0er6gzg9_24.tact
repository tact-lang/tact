contract Test5 {
    receive() {
        // Testing shallow equality (==) vs deep equality for maps inserted in different orders
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();

        // Insert into m1 in order: key 1 then key 2
        m1.set(1, 10);
        m1.set(2, 20);
        
        // Insert into m2 in reverse order: key 2 then key 1
        m2.set(2, 20);
        m2.set(1, 10);
        
        // According to documentation, deepEquals should return true because both maps
        // have the same key-value pairs, but shallow equality (==) may return false
        // due to differences in underlying serialization/hashing of map structure.
        dump(m1.deepEquals(m2)); // Expected: true
        dump(m1 == m2);         // Expected: false (if shallow comparison is used)
    }
}
