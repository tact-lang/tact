contract Test {
    m: map<Int, Int>;

    init() {
        // initialize map as empty
        self.m = emptyMap();
        // set a sample value
        self.m.set(42, 100);
    }

    // Getter that returns the value for a given key from the map
    // If the key doesn't exist, it returns null
    get fun getValue(key: Int): Int? {
        return self.m.get(key);
    }

    receive() {}
}
