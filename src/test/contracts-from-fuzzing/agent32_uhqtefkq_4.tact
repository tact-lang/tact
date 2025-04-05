contract MapsTest() {
    // This function tests the map type: setting, replacing, getting, and deletion.
    fun testMap(): Int {
        // Create a map from Int to Int
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        // Overriding value for key 2
        m.replaceGet(2, 300); // returns previous value, but we ignore it here
        
        // Check existence and get values
        let v1: Int = m.get(1)!!; // should be 100
        let v2: Int = m.get(2)!!; // should be 300
        
        // Delete key 1
        m.del(1);
        
        // If deletion worked, m.get(1) should be null, so add zero
        let v1_after: Int = (m.get(1) != null) ? m.get(1)!! : 0;
        
        return v1 + v2 + v1_after; // Expected: 100 + 300 + 0 = 400
    }

    receive() {
        let result = self.testMap();
        dump(result); // dump 400
        cashback(sender());
    }
}
