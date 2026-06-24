contract FuzzyDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int?;
    e: Bool?;
    f: String?;
    init() {
        self.d = null;
        self.e = null;
        self.f = null;
    }
}