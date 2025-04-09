contract TestMap {
    m: map<Int, Int>; // empty map by default

    receive() {}

    // Getter to retrieve a value from the map; returns null if key does not exist
    get fun getValue(key: Int): Int? {
         return self.m.get(key);
    }
}
