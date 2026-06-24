contract OptionalAndValue {
    a: Int?;
    b: Int;
    c: String?;
    d: Bool;

    init() {
        self.a = null;
        self.b = 42;
        self.c = null;
        self.d = true;
    }
}
