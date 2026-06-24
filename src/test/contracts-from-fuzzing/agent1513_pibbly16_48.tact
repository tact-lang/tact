contract NestedDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "str";
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.d = null;
        self.e = null;
        self.f = "f";
    }
}