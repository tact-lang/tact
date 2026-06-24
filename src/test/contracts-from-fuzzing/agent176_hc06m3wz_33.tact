contract NullDefaults {
    a: Int?;
    b: Bool? = null;
    c: String?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}