contract OptionalsMixedDefaults {
    a: Int?;
    b: Int? = null;
    c: Bool?;
    d: Bool? = true;
    e: String?;
    f: String? = "foo";

    init() {
        self.a = 1;
        self.c = null;
        self.e = null;
    }
}