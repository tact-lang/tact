contract OptionalAndPrimitiveTogether {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.a = 42;
        self.b = true;
        self.c = "test";
        self.d = null;
        self.e = false;
        self.f = null;
    }
}
