contract MapKeyGetter {
    m: map<Int, Int>;

    receive() {}

    // Getter returns value for provided key from map m. Returns null if key doesn't exist.
    get fun get_value(key: Int): Int? {
        return self.m.get(key);
    }
}
