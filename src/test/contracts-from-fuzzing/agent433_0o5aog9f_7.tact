contract TestContract {
    a: Int = 1;
    b: Int as uint8 = 2;
    c: Int as int8 = -5;
    d: Int as uint64 = 10;
    e: Int as int64 = -10;
    f: Bool = true;

    init() {
        self.a = 99;
        self.b = 3;
        self.c = -3;
        self.d = 20;
        self.e = -20;
        self.f = false;
    }
}