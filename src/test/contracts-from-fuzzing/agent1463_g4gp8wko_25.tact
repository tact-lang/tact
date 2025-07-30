contract OptMix {
    a: Int?;
    b: Int;
    c: Bool?;
    d: Bool = false;
    e: String?;
    f: String = "x";

    init() {
        self.a = null;
        self.b = 2;
        self.c = true;
        self.d = true;
        self.e = "test";
        self.f = "done";
    }
}
