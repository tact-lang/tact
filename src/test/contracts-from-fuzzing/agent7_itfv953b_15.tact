contract ImplicitDefaults {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;

    init() {
        self.a = 7;
        self.b = true;
        self.c = "hi";
        self.d = null;
        self.e = null;
    }
}