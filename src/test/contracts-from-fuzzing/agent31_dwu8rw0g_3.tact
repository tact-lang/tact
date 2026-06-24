contract Test {
    m: map<Int, Int>;
    init() {
        self.m = emptyMap();
        self.m.set(1, 2);
    }
}