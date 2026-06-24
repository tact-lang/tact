contract Test_get {
    receive() {
        // Create an empty map of Int to Int
        let m: map<Int, Int> = emptyMap();
        
        // Set a value for key 1
        m.set(1, 100);
        
        // Retrieve the value for an existing key (should be 100) and for a missing key (should be null)
        let value1: Int = m.get(1)!!; // Force unwrap: this should yield 100
        let value2: Int? = m.get(2);  // This key is not set, so should yield null
        
        // Dump the results
        dump(value1); // Expected output: 100
        dump(value2); // Expected output: null
    }
}
