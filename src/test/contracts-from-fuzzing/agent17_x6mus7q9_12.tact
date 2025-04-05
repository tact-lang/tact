contract TestMapExpressions {
    fun run() {
        // Create an empty map of Int to Int
        let m: map<Int, Int> = emptyMap();
        // Set key 1 to 42
        m.set(1, 42);
        // Retrieve the value at key 1 (using non-null assertion)
        dump(m.get(1)!!); // Expected output: 42

        // Compare the map with an empty map
        dump(m == emptyMap()); // Expected output: false

        // Convert the map to its underlying Cell type
        dump(m.asCell());
    }
    receive() {
        self.run();
    }
}
