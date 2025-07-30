contract DefaultOptMix {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Int as uint8 = 5;
    e: Int? as uint8 = null;

    init() {
        self.a = 42;
        self.b = true;
        self.c = "str";
        self.d = 7;
        self.e = 9;
    }
}
