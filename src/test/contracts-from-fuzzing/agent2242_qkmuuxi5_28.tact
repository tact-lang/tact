contract InterleavedDefaults {
    a: Int = 5;
    b: Bool;
    c: String = "hello";
    d: Int?;
    e: Bool? = null;

    init() {
        self.b = true;
        self.d = null;
    }
}