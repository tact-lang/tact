contract OptionalMismatch {
    a: Int;
    b: Int?;
    c: Int;
    init() {
        self.a = 5;
        self.b = null;
        self.c = 7;
    }
}