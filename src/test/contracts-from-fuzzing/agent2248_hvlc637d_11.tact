contract OptionalDefaults {
    a: Int?;
    b: Bool?;
    c: String?;

    init() {
        self.a = 3;
        self.b = true;
        self.c = null;
    }
}