contract OptionalVsNonOptional {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Bool;
    f: Bool?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = "a";
        self.d = null;
        self.e = true;
        self.f = null;
    }
}
