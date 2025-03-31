contract TestGetterMap {
    m: map<Int, Int>;

    init() {
        self.m = emptyMap();
    }

    receive() {}

    get fun getValue(): Int? {
        return self.m.get(5);
    }
}
