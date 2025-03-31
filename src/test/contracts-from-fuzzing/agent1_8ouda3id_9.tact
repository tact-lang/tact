contract Test7 {
    m: map<Int, Int>;

    receive() {}

    // Getter function that returns the value from the map for the given key, might be null if key does not exist
    get fun getFromMap(key: Int): Int? {
        return self.m.get(key);
    }
}
