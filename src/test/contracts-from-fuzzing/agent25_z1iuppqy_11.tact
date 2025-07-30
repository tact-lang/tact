contract GetterArgMap {
    m: map<Int, Int>;

    init() {
        self.m.set(1, 100);
        self.m.set(2, 200);
    }

    receive() {}

    // Getter with an argument is used to retrieve a value for a given key in the map
    get fun get_value(key: Int): Int? {
        return self.m.get(key);
    }
}
