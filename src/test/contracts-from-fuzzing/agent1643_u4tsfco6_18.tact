contract DefaultVals {
    a: Int = 4;
    b: Bool = true;
    c: String = "str";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;

    init() {
        self.a = 5;
        self.b = false;
        self.c = "hey";
        self.d = null;
        self.e = null;
        self.f = null;
    }
}