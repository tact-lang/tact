contract OnlyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.a = 0;
        self.b = true;
        self.c = "";
        self.d = null;
        self.e = null;
        self.f = null;
    }
}