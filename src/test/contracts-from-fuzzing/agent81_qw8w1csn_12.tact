contract TestMissingKey {
    m: map<Int, Int>;

    init() {
        self.m = emptyMap();
        self.m.set(10, 100);
    }

    receive() {}

    get fun getMissing(key: Int): Int? {
        return self.m.get(key);
    }
}
