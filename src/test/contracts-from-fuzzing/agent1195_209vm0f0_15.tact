contract OptsAndDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int = 1;
    e: Bool = true;
    f: String = "x";

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = 2;
        self.e = false;
        self.f = "y";
    }
}
