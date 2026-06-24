contract MultipleTopVars {
    a: Int = 0;
    b: Bool = true;
    c: String = "abc";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;

    init() {
        self.a = 9;
        self.b = false;
        self.c = "def";
        self.d = 42;
        self.e = true;
        self.f = "ghi";
    }
}
