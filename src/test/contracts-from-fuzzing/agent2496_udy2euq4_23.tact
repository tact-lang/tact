contract OptionalMixed {
    a: Int?;
    b: String?;
    c: Bool?;

    init() {
        self.a = 123;
        self.b = null;
        self.c = false;
    }
}
