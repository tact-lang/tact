contract TestContract {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint32;
    d: Int as coins; // coins serialization (variable size)
    e: Bool;
    f: Bool;
    g: Bool;

    init() {
        self.a = 255;
        self.b = -123456789;
        self.c = 4294967295;
        self.d = ton("1");
        self.e = true;
        self.f = false;
        self.g = true;
    }
}