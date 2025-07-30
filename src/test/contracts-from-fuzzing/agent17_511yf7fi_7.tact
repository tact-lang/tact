contract TestMapExists {
    receive() {
        let m: map<Int, Int> = emptyMap();
        
        // Insert a key-value pair
        m.set(10, 55);
        
        // Check existence for existing key
        let exists1: Bool = m.exists(10);
        
        // Check existence for non-existent key
        let exists2: Bool = m.exists(5);
    }
}
