contract Test6 {
    receive() {
        // Testing deletion of keys during iteration:
        // Create a map with three entries
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        m.set(3, 300);
        
        // Iterate over the map; delete the entry when key is 2
        foreach (k, v in m) {
            if (k == 2) {
                m.del(k);
            }
        }
        
        // Verify that key 2 has been deleted and others remain
        dump(m.exists(2)); // Expected to dump false
        dump(m.get(1)!! + m.get(3)!!); // Expected to dump 100+300 = 400
    }
}
