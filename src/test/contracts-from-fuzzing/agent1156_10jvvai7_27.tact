contract ZeroDefaults {
    a: Int = 0;
    b: Int as uint8 = 0;
    c: Int as coins = 0;
    d: Bool = false;
    e: String = "";

    init() {
        self.a = 0;
        self.b = 0;
        self.c = 0;
        self.d = false;
        self.e = "";
    }
}