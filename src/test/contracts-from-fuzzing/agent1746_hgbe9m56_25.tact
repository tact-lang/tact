contract OptDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = null;
    d: Int? = 4;
    e: Bool? = false;
    f: String? = "hi";

    init() {
        self.a = 1;
        self.b = false;
        self.c = "x";
        self.d = 5;
        self.e = true;
        self.f = "y";
    }
}
