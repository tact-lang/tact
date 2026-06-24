contract TestMapExists {
    receive() {
        // Create an empty local map
        let m: map<Int, Int> = emptyMap();
        
        // Set a key-value pair with key 3
        m.set(3, 30);
        
        // Case 1: Check existence of an existing key (3) - should be true
        let existsTrue: Bool = m.exists(3);
        dump(existsTrue);
        
        // Case 2: Check existence of a non-existent key (4) - should be false
        let existsFalse: Bool = m.exists(4);
        dump(existsFalse);
    }
}
