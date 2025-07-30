contract OptionalAndNonOptional {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
    e: Bool;
    f: Bool?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = 2;
        self.d = 3;
        self.e = true;
        self.f = null;
    }
}