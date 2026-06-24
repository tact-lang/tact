contract OptionalOnly {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;

    init() {
        self.a = 7;
        self.b = null;
        self.c = true;
        self.d = null;
    }
}
