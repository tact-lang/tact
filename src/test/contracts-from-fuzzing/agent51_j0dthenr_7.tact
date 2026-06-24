contract TestMapLookup {
    data: map<Int, Int> = emptyMap();

    init() {
        // setting only one key
        self.data.set(1, 123);
    }

    receive() {}

    // Getter function that looks up a key in the map and returns an optional Int
    get fun lookup(key: Int): Int? {
        return self.data.get(key);
    }
}
