contract TestContract {
    a: String = "a";
    b: String? = null;
    c: Bool = true;
    d: Bool? = null;
    e: Int = 1;
    f: Int? = null;

    init() {
        self.a = "aa";
        self.b = "bb";
        self.c = false;
        self.d = true;
        self.e = 11;
        self.f = 22;
    }
}