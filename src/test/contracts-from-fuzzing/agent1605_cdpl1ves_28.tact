contract DefaultsAndNulls {
    i: Int = 7;
    b: Bool = false;
    s: String = "str";
    ci: Int? = null;
    cs: String? = null;
    cb: Bool? = null;

    init() {
        self.i = 10;
        self.b = true;
        self.s = "abc";
        self.ci = null;
        self.cs = null;
        self.cb = null;
    }
}