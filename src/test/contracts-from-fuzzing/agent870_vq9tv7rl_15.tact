contract OptionalTree {
    a: Int? = null;
    b: Int? = 1;
    c: Bool? = null;
    d: Bool? = false;
    s: String? = null;
    s2: String? = "x";

    init() {
        self.a = null;
        self.b = 2;
        self.c = true;
        self.d = null;
        self.s = "abc";
        self.s2 = null;
    }
}
