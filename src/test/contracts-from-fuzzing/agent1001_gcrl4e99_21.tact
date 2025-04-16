contract DefaultsAndOpt {
    a: Int? = null;
    b: Bool? = true;
    c: String? = null;
    d: Bool = false;
    e: Int = 123;

    init() {
        self.a = 99;
        self.b = null;
        self.c = "ok";
        self.d = true;
        self.e = 321;
    }
}