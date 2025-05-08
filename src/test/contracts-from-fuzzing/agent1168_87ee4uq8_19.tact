contract ExtendedDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "str";
    d: Int?;
    e: Bool? = false;
    f: String?;

    init() {
        self.d = null;
        self.f = null;
    }
}