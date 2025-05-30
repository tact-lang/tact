contract NullDefaults {
    a: Int?;
    b: String?;
    c: Address?;
    d: Cell?;
    e: Bool?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}