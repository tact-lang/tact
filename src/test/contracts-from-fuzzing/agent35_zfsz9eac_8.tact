contract TestMapReplaceGet {
    // Map from Int to Int
    stateMap: map<Int, Int>;

    init() {
        self.stateMap = emptyMap();
        // Initialize with key 1 => 5
        self.stateMap.set(1, 5);
    }

    receive() {
        // Use replaceGet: replace key 1's value to 15, and get previous value
        let old: Int? = self.stateMap.replaceGet(1, 15); // expected old value: 5
        // Use replaceGet on a non-existent key
        let none: Int? = self.stateMap.replaceGet(2, 20); // expected: null, key 2 not present
    }
}
