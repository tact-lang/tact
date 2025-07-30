contract OptPrimitivesWithDefaults {
    a: Int? = null;
    b: Int? = 1;
    c: Bool? = null;
    d: Bool? = true;
    s: String? = null;
    t: String? = "abc";

    init() {
        self.a = 5;
        self.b = 10;
        self.c = false;
        self.d = null;
        self.s = "foo";
        self.t = null;
    }
}