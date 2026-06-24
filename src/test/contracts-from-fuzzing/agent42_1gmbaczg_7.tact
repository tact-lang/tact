contract TestMap {
    // Persistent map from Int to Int, initialized as an empty map
    m: map<Int, Int> = emptyMap();

    receive() {}

    // Getter that returns the mapped value for a given key, or null if the key is not present
    get fun getMapped(key: Int): Int? {
        return self.m.get(key);
    }
}
