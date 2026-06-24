contract WithDefaults {
    a: Int = 100;
    b: Bool = false;
    s: String = "init";
    oi: Int? = null;
    os: String? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.s = "override";
        self.oi = 42;
        self.os = "str";
    }
}