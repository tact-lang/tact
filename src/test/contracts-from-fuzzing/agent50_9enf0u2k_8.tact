contract TestMap {
    // Declare a persistent map using proper generic syntax: angle brackets
    m: map<Int, Int>;

    receive() {}

    // Getter that returns an optional Int by accessing the map via the .get() extension method
    get fun getValue(key: Int): Int? {
        return self.m.get(key);
    }
}
