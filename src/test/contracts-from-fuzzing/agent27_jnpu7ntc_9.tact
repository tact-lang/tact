contract TestMapForeach {
    receive() {
        // Test: Iteration over entries using foreach
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        
        // Iterating over the map and dumping keys and values
        foreach (key, value in m) {
            dump(key);
            dump(value);
        }
    }
}
