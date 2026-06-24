contract OptionalsDefaultsMix {
    a: Int? = 1;
    b: String? = "str";
    c: Bool? = true;
    d: Int?;
    e: String?;
    f: Bool?;

    init() {
        self.d = null;
        self.e = null;
        self.f = null;
    }
}
