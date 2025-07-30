contract SerializationMix {
    a: Int as uint8 = 42;
    b: Int as int16 = -55;
    c: Int as coins = ton("1");
    d: Bool = true;
    e: String = "hi";
    f: Int? as uint32 = null;
    g: Bool? = null;

    init() {
        self.a = 15;
        self.b = -22;
        self.c = ton("0.5");
        self.d = false;
        self.e = "bye";
        self.f = 999;
        self.g = true;
    }
}
