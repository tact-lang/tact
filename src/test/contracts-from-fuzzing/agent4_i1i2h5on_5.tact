contract TestContract {
    a: Int;
    b: Int as uint8;
    c: Int as int32;
    d: Int as uint64;
    e: Bool;
    f: Bool;

    init() {
        self.a = -1;
        self.b = 255;
        self.c = -123456;
        self.d = 123456789;
        self.e = true;
        self.f = false;
    }
}
