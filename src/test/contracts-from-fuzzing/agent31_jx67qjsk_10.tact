contract Test {
    receive() {
        // Create two empty maps
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        
        // Both maps have identical entries
        m1.set(5, 55);
        m2.set(5, 55);
        
        // deepEquals should return true
        let eq1: Bool = m1.deepEquals(m2);
        
        // Add an extra entry in m2
        m2.set(10, 100);
        
        // Now deepEquals should return false
        let eq2: Bool = m1.deepEquals(m2);
        
        // Dump 1 if both conditions hold, otherwise dump 0
        if (eq1 && !eq2) { dump(1); } else { dump(0); }
    }
}
