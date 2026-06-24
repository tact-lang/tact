contract OptionalBoolInt {
    a: Bool?;
    b: Int?;
    c: Bool?;
    d: Int?;

    init() {
        self.a = true;
        self.b = 123;
        self.c = null;
        self.d = null;
    }
}
