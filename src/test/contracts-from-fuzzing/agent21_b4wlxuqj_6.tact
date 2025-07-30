contract TestMap {
    m: map<Int, Int>; // persistent map state, auto-initialized to empty

    receive() {}

    // Getter with a parameter accessing a map value
    get fun get_map_value(key: Int): Int? {
        return self.m.get(key);
    }
}
