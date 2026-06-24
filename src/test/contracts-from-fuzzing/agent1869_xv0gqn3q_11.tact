contract OptionalAndNonOptional {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Slice;
    f: Slice?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = emptyCell().asSlice();
        self.f = null;
    }
}