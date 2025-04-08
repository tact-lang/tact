contract Test {
    m: map<Int, Int>;

    init() {
        self.m = emptyMap();
    }

    receive() {
        self.m.set(1, 1);
    }
}