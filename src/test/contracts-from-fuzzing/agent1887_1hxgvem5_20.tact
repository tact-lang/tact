contract OnlyOptionalFields {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;

    init() {
        self.a = null;
        self.b = null;
        self.c = 123;
        self.d = true;
    }
}