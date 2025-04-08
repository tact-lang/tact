// vector of mixed fixed-size and default-initialized fields
contract Test {
    a: Int as uint8 = 0;
    b: Int as int32 = -1;
    c: Int as uint64 = 0;
    d: Int = 0;
    e: Bool = false;
    f: Bool? = null;
    s: String? = null;

    init() {
        self.a = 255;
        self.b = 1000;
        self.c = 100000;
        self.d = 1000000;
        self.e = true;
        self.f = true;
        self.s = "test";
    }
}