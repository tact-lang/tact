contract NullsVsDefaults {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;

    init() {
        self.a = 0;
        self.b = null;
        self.c = true;
        self.d = null;
    }
}
