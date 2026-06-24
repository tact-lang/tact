contract FlippedDefaults {
    a: Int?;
    b: Int = 1;
    c: String?;
    d: String = "txt";
    e: Bool?;
    f: Bool = false;

    init() {
        self.a = null;
        self.c = null;
        self.e = null;
    }
}