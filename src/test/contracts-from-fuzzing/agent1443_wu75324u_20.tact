contract OnlyPrimitives {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;

    init() {
        self.a = 5;
        self.b = "hi";
        self.c = true;
        self.d = null;
        self.e = null;
        self.f = null;
    }
}