contract InterleavedDefaults {
    a: Int = 1;
    b: Int;
    c: Int? = null;
    d: Int?;

    init() {
        self.b = 2;
        self.d = null;
    }
}