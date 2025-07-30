contract TestGetterMap {
    // Declare a map from Int to Int using angle brackets
    m: map<Int, Int>;

    receive() {}

    // Getter that attempts to retrieve a value from the map
    get fun getValue(key: Int): Int? {
        return self.m.get(key);
    }
}
