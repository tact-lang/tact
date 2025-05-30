contract OptionalDefaults {
    a: Int?;
    b: Int = 42;
    c: Bool?;

    init() {
        self.a = null;
        self.b = 43;
        self.c = null;
    }
}