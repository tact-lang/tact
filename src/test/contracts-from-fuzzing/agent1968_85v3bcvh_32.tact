contract Test33 {
    a: Int = 5;
    b: Int as uint8 = 255;
    c: Int as int8 = -128;
    d: Bool = true;
    e: String = "test";
    f: Address? = null;

    init() {
        self.a = 10;
        self.b = 254;
        self.c = -100;
        self.d = false;
        self.e = "done";
        self.f = null;
    }
}