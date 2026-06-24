contract TestMap {
    m: map<Int, Int>;

    init() {
        self.m = emptyMap();
        self.m.set(5, 50);
    }

    receive() {}

    get fun getValue(key: Int): Int? {
        return self.m.get(key);
    }
}
