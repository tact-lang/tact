contract OptionalAndNonOptional {
    a: Int?;
    b: Int;
    c: Bool?;
    d: Bool;
    e: String?;
    f: String;

    init() {
        self.a = null;
        self.b = 5;
        self.c = null;
        self.d = true;
        self.e = null;
        self.f = "zz";
    }
}
