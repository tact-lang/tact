contract MapTest {
    // A map from Int to Int using correct syntax
    m: map<Int, Int>;

    receive() {}

    // Getter that retrieves a value from the map by key, returning an optional Int
    get fun getValue(key: Int): Int? {
        return self.m.get(key);
    }
}
