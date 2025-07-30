contract InterleavedDefaultsOpts {
    a: Int = 1;
    b: Int?;
    c: Int = 2;
    d: Int?;
    e: Int = 3;

    init() {
        self.b = null;
        self.d = null;
    }
}