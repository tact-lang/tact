contract OptionalDefaultZeroes {
    a: Int?;
    b: Bool?;
    c: Int;
    d: Bool;

    init() {
        self.a = null;
        self.b = null;
        self.c = 0;
        self.d = false;
    }
}