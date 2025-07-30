contract TestMapReplace {
    // Map from Int to Int
    stateMap: map<Int, Int>;

    init() {
        self.stateMap = emptyMap();
        // Set initial key-value pair: key 1 with value 10
        self.stateMap.set(1, 10);
    }

    receive() {
        // Replace value for existing key 1 from 10 to 20
        self.stateMap.replace(1, 20);
        // Attempt to replace value for non-existent key 2 with 30 (edge-case)
        self.stateMap.replace(2, 30);

        // Retrieve values for inspection (for testing purposes)
        let a: Int? = self.stateMap.get(1); // Expected: 20
        let b: Int? = self.stateMap.get(2); // Expected: might be 30 if replacement auto-inserts or remains null if ignored
    }
}
