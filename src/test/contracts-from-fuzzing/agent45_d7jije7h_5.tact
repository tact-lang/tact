contract Test {
    receive() {
        // Testing .replace() on map<Int, Int>
        let m: map<Int, Int> = emptyMap();
        
        // Set initial values
        m.set(1, 10);
        m.set(3, 40);
        
        // Case 1: Replace an existing key
        let r1: Bool = m.replace(1, 20); // Should return true and update key 1 to 20
        dump(r1);                // Expect to dump: true
        let v1: Int = m.get(1)!!; // Should now be 20
        dump(v1);                // Expect to dump: 20
        
        // Case 2: Attempt to replace a non-existent key
        let r2: Bool = m.replace(2, 30); // Should return false, key 2 does not exist
        dump(r2);                // Expect to dump: false
        
        // Case 3: Replace an existing key with null to delete it
        let r3: Bool = m.replace(3, null); // Should return true and delete key 3
        dump(r3);                // Expect to dump: true
        if (m.exists(3)) {
            dump(999);
        } else {
            dump(888);         // Expect to dump: 888 (entry deleted)
        }
    }
}
