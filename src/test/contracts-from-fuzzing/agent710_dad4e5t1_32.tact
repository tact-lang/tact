contract LargeMixed {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;

    init() {
        self.a = 10;
        self.b = true;
        self.c = "y";
        self.d = 20;
        self.e = false;
        self.f = "z";
    }
}