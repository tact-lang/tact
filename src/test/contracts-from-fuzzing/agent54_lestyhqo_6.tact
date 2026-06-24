contract TestMap {
    m: map<Int, Int>;
    receive() {}

    // Getter that retrieves a value from the map.
    // If the key is not present, it should return null.
    get fun getMapValue(key: Int): Int? {
        return self.m.get(key);
    }

    init() {
        // Initialize the map.
        self.m = emptyMap();
        // Optionally add an entry
        self.m.set(42, 100);
    }
}
