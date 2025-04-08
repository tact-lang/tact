contract InitVsDefaults {
    a: Int = 1;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.b = true;
        self.c = "yo";
        self.d = null;
        self.e = null;
        self.f = null;
    }
}