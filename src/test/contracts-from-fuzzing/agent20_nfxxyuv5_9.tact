contract TestMapDeepEquals {
    receive() {
        // Create two local maps with the same key-value pairs but inserted in different order
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        
        m1.set(1, 10);
        m1.set(2, 20);

        m2.set(2, 20);
        m2.set(1, 10);
        
        // Using deepEquals should yield true as both maps contain identical entries
        dump(m1.deepEquals(m2)); // expected output: true
        
        // Compare using shallow equality operator
        dump(m1 == m2); // expected output: true if maps are serialized identically
    }
}
