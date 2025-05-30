contract DefaultMix {
    a: Int = 10;
    b: Bool = true;
    c: String = "ok";
    d: Int? = null;

    init() {
        self.a = 11;
        self.b = false;
        self.c = "no";
        self.d = null;
    }
}