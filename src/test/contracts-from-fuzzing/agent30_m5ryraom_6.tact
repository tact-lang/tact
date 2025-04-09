contract TestMap {
    // Correct map syntax uses angle brackets
    m: map<Int, Int>;

    init() {
        self.m = emptyMap();
        self.m.set(100, 256);
    }

    // Getter that takes a key and returns an optional Int from the map
    get fun getValue(key: Int): Int? {
        return self.m.get(key);
    }

    receive() {}
}
