contract TestMapExists {
    // Map from Int to Bool
    stateMap: map<Int, Bool>;

    init() {
        self.stateMap = emptyMap();
        // Insert a key with value true
        self.stateMap.set(1, true);
    }

    receive() {
        // Test existence of key 1 (should be true) and key 2 (should be false)
        let exists1: Bool = self.stateMap.exists(1);
        let exists2: Bool = self.stateMap.exists(2);
    }
}
