contract TestMapReplace {
    receive() {
        // Initialize empty map
        let m: map<Int, Int> = emptyMap();
        
        // Set a key-value pair
        m.set(7, 70);
        
        // Replace value for existing key; should return true
        let rep1: Bool = m.replace(7, 68);
        
        // Replace value for non-existing key; should return false
        let rep2: Bool = m.replace(8, 68);
        
        // Replace with null for existing key; should delete the entry and return true
        let repDel: Bool = m.replace(7, null);
        
        // Try to get the deleted key; should be null
        let getAfter: Int? = m.get(7);
    }
}
