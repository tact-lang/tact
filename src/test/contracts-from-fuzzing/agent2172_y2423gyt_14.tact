contract OptionalDefaults {
    a: Int?;
    b: Bool?;
    c: String?;

    init() {
        self.a = 123;
        self.b = true;
        self.c = "str";
    }
}