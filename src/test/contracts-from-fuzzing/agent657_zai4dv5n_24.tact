contract OptDefaults {
    a: Int?;
    b: Int? = null;
    c: Bool?;
    d: Bool? = null;
    e: String?;
    f: String? = null;

    init() {
        self.a = null;
        self.c = null;
        self.e = null;
    }
}