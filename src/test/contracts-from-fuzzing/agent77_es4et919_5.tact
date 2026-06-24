contract OptionalGetter {
    m: map<Int, Int> = emptyMap();

    init() {
        self.m.set(7, 77);
    }

    receive() {}

    // Getter that takes a key and returns an optional Int
    get fun getValue(key: Int): Int? {
        return self.m.get(key);
    }
}
