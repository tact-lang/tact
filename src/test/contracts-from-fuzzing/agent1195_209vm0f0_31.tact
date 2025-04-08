contract OptDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int = 1;
    e: Bool = false;
    f: String = "default";
    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = 2;
        self.e = true;
        self.f = "set";
    }
}
