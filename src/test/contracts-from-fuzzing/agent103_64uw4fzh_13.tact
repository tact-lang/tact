contract TestFields {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Bool;
    f: Bool?;

    init() {
        self.a = 11;
        self.b = null;
        self.c = "hello";
        self.d = null;
        self.e = true;
        self.f = null;
    }
}
