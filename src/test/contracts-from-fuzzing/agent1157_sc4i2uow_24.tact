contract InitDefaults {
    n: Int = 1;
    b: Bool = false;
    s: String = "ok";
    o: Int? = null;

    init() {
        self.n = 2;
        self.b = true;
        self.s = "no";
        self.o = 10;
    }
}