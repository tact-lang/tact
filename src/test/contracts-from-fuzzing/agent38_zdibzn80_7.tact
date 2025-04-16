contract Test_deepEquals {
    receive() {
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        
        // Both maps are empty and should be deep equal
        dump(m1.deepEquals(m2)); // Expected output: true
        
        // Adding same key-value pair in both maps
        m1.set(1, 100);
        m2.set(1, 100);
        dump(m1.deepEquals(m2)); // Expected output: true
        
        // Changing value in second map
        m2.set(1, 200);
        dump(m1.deepEquals(m2)); // Expected output: false
    }
}
