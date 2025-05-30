contract EmptyDefaults {
    i: Int = 42;
    b: Bool = false;
    s: String = "hello";
    oi: Int? = null;
    ob: Bool? = null;
    os: String? = null;

    init() {
        self.i = 100;
        self.b = true;
        self.s = "world";
        self.oi = 50;
        self.ob = true;
        self.os = "x";
    }
}
