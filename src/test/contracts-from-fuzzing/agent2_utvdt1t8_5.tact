contract Test {
    receive() {
        // Using a local map for testing .replaceGet and .exists operations
        let m: map<Int, Int> = emptyMap();
        
        // Set initial key-value pairs
        m.set(7, 70);
        m.set(42, 42);
        
        // Replace value for an existing key using replaceGet; should return old value
        let oldVal1: Int? = m.replaceGet(7, 68); // now key 7 should point to 68
        dump(oldVal1!!); // Expected output: 70
        
        // Attempt to replace a non-existent key; should return null
        let oldVal2: Int? = m.replaceGet(8, 68);
        if (oldVal2 == null) {
            dump(0); // Expected output: 0
        } else {
            dump(oldVal2!!);
        }
        
        // Replace existing key with null, which should delete the entry; returns old value
        let oldVal3: Int? = m.replaceGet(7, null);
        dump(oldVal3!!); // Expected output: 68
        
        // Check that key 7 is no longer in the map
        if (!m.exists(7)) {
            dump(1); // Expected output: 1, indicating deletion successful
        } else {
            dump(2);
        }
    }
}
