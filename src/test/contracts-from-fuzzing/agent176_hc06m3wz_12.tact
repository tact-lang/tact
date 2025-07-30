contract OptionalChain {
    a: Int? = null;
    b: Bool? = true;
    c: String? = "ok";
    d: Int? = 0;
    e: Bool? = null;
    f: String? = null;

    init() {
        self.a = 15;
        self.b = false;
        self.c = null;
        self.d = null;
        self.e = true;
        self.f = "hi";
    }
}