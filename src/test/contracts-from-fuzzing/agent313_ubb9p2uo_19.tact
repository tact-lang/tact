contract TrailingCommas {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
    d: Int? = null;
    e: Bool? = true;

    init() {
        self.a = 2;
        self.b = true;
        self.c = "y";
        self.d = 42;
        self.e = null;
    }
}