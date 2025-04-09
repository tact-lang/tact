contract OptionalVsNonOptional {
    a: Int = 42;
    b: Int?;
    c: Bool = true;
    d: Bool?;
    e: String = "hi";
    f: String?;

    init() {
        self.b = null;
        self.d = null;
        self.f = null;
    }
}
