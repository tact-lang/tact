contract InterleavedDefaults {
    a: Int = 1;
    b: Int;
    c: Int = 3;
    d: Int;

    init() {
        self.b = 2;
        self.d = 4;
    }
}