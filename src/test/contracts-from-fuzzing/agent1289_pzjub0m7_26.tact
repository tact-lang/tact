contract DefaultsAndAs {
    a: Int as uint16 = 65535;
    b: Int as int32 = -12345;
    c: Bool = true;
    d: Int as coins = 10000000;
    e: String = "ok";

    init() {
        self.a = 555;
        self.b = -42;
        self.c = false;
        self.d = 10;
        self.e = "hello";
    }
}