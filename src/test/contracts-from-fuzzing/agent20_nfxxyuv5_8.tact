contract TestMapIsEmpty {
    receive() {
        // Create an empty local map
        let m: map<Int, Int> = emptyMap();

        // Check isEmpty on an empty map; expect true
        dump(m.isEmpty());

        // Set a key-value pair
        m.set(1, 10);
        
        // Check isEmpty on a non-empty map; expect false
        dump(m.isEmpty());
    }
}
