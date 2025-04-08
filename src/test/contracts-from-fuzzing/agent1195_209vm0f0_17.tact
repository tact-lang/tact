contract ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int as uint32 = 42;
    e: Bool?;
    f: Int?;

    init() {
        self.e = null;
        self.f = null;
    }
}
