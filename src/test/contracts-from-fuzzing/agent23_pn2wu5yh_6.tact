contract GetterMap {
    m: map<Int, Int>;

    receive() {}

    // Getter function that accesses the map for the given key and returns an optional Int
    get fun getFromMap(key: Int): Int? {
        return self.m.get(key);
    }
}
