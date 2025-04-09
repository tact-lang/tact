contract GetterTestMap {
    m: map<Int, Int>;

    init() {
        self.m = emptyMap();
        self.m.set(1, 10);
    }

    receive() {}

    get fun getMissing(): Int? {
        return self.m.get(2);
    }
}
