contract TestContract {
    a: Int as int4;
    b: Int as uint1;
    c: Int as int64;
    d: Int as uint32;
    e: String;
    f: Bool;

    init() {
        self.a = 7;
        self.b = 1;
        self.c = -123456789;
        self.d = 987654321;
        self.e = "data";
        self.f = false;
    }
}