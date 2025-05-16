contract OptionalMultiple {
    a: Int?;
    b: Int?;
    c: Int?;

    init() {
        self.a = null;
        self.b = 2;
        self.c = null;
        self.a = 1;
        self.b = null;
    }
}