contract TestOptional {
    m: map<Int, Int>;

    receive() {}

    // Getter that returns an optional Int; for non-existent keys, returns null
    get fun optLookup(key: Int): Int? {
        return self.m.get(key);
    }
}
