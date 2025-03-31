contract Test3 {
    receive() {
        // Testing modifying a map during a foreach loop
        // This loop iterates over all key-value pairs in a local map and doubles each value
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);

        foreach (k, v in m) {
            // Attempt to modify the map entry during iteration
            m.set(k, v * 2);
        }
        
        // Retrieve and dump a value to verify the modification
        dump(m.get(1)!!); // Expected to dump 20 if modifications are applied
        dump(m.get(2)!!); // Expected to dump 40 if modifications are applied
    }
}
