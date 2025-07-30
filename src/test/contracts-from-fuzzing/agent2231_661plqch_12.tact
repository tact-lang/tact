contract OptionalsMixed {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int;
    e: Bool;
    f: String;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = 1;
        self.e = true;
        self.f = "hello";
    }
}