contract OptionalTupleLike {
    a: Int?;
    b: Int?;
    c: Int?;

    init() {
        self.a = null;
        self.b = 42;
        self.c = null;
    }
}
