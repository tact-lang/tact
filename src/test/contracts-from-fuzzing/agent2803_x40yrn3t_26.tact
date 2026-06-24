contract OptionalDefaultsMix {
    a: Int?;
    b: Int = 5;
    c: Bool?;
    d: Bool = true;
    e: String?;
    f: String = "def";

    init() {
        self.a = null;
        self.b = 10;
        self.c = null;
        self.d = false;
        self.e = null;
        self.f = "changed";
    }
}