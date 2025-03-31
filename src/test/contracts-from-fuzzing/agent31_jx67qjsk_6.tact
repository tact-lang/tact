contract Test {
    receive() {
        // Create an empty map from Int to Int using correct angle brackets in type definition
        let m: map<Int, Int> = emptyMap();

        // Typical usage: setting a key-value pair (mutating in place)
        m.set(10, 123);
        
        // Retrieve the value for key 10 (should be Some(123))
        let val1: Int? = m.get(10);
        
        // Edge case: Retrieve value for non-existent key
        let val2: Int? = m.get(20);
        
        // Dummy usage to avoid unused variable warnings:
        // If the retrieval works as expected, we should dump 1 (for key 10) and 2 (for missing key)
        if (val1 != null) { dump(1); } else { dump(0); }
        if (val2 == null) { dump(2); } else { dump(0); }
    }
}
