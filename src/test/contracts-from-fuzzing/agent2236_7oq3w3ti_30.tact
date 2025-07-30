contract AllDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "str";
    d: Int?;
    e: String?;

    init() {
        self.d = null;
        self.e = null;
    }
}