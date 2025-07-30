contract VarOrdering {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: Bool? = null;
    e: String = "e";
    f: String? = null;
    g: Int? = null;

    init() {
        self.a = 10;
        self.b = 20;
        self.c = false;
        self.d = false;
        self.e = "changed";
        self.f = "hi";
        self.g = 30;
    }
}
