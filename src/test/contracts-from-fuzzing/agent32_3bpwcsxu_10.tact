contract Test {
    receive() {
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        
        // Both maps are empty initially, deepEquals should return true
        dump(m1.deepEquals(m2)); // Expected output: true
        
        // Set same key-value in both maps
        m1.set(1, 100);
        m2.set(1, 100);
        dump(m1.deepEquals(m2)); // Expected output: true
        
        // Change m2 by adding another entry
        m2.set(2, 200);
        dump(m1.deepEquals(m2)); // Expected output: false
    }
}
