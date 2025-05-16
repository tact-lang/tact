contract TestMapGetter {
    m: map<Int, Int>;

    init() {
        self.m = emptyMap();
    }

    receive() {}

    // Getter that attempts to retrieve a value from the map with key 42.
    // Returns an optional Int because the key might not exist.
    get fun getKey(): Int? {
        return self.m.get(42);
    }
}
