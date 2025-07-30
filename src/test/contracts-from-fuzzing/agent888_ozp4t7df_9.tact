contract DefaultInitialized {
    a: Int = 0;
    b: String = "";
    c: Bool = false;
    d: Int? = null;
    e: String? = null;
    f: Bool? = null;

    init() {
        self.a = 10;
        self.b = "abc";
        self.c = true;
        self.d = null;
        self.e = null;
        self.f = false;
    }
}