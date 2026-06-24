contract TestGetterMapMissing {
    m: map<Int, Int>;

    init() {
        self.m = emptyMap();
        self.m.set(100, 1);
    }

    receive() {}

    // Getter that returns an optional Int by trying to get a missing key
    get fun getMissing(): Int? {
        return self.m.get(123);
    }
}
