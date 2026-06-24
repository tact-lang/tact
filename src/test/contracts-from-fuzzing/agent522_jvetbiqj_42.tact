contract IntOptionalCombos {
    a: Int;
    b: Int?;
    c: Int as uint64;
    d: Int?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = 42;
        self.d = null;
    }
}