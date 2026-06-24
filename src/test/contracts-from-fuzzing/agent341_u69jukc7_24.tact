contract OptionalFields {
    a: Int?;
    b: String?;
    c: Bool?;

    init() {
        self.a = 42;
        self.b = null;
        self.c = true;
    }
}